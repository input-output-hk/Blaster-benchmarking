/- Self-contained integer UPLC evaluator (Lean core only; no Mathlib/Blaster).
   A structural, fuel-based CEK-style evaluator over the integer-arithmetic
   fragment of Untyped Plutus Core. Structural recursion => reduces definitionally
   so reduction tactics can attempt it; SMT tactics (auto/blaster) reason symbolically. -/
namespace Uplc

inductive Bltn | Add | Sub | Mul | Div | Mod
  deriving Repr, DecidableEq

inductive Term
  | var (n : String) | con (i : Int) | lam (n : String) (b : Term)
  | app (f a : Term) | bltn (b : Bltn) | err
  deriving Repr

inductive Val
  | vint (i : Int)
  | vclos (n : String) (b : Term) (env : List (String × Val))
  | vbltn (b : Bltn) (args : List Val)
  deriving Repr

abbrev Env := List (String × Val)

def compute (b : Bltn) (x y : Int) : Option Val :=
  match b with
  | .Add => some (.vint (x + y)) | .Sub => some (.vint (x - y))
  | .Mul => some (.vint (x * y))
  | .Div => if y = 0 then none else some (.vint (x / y))
  | .Mod => if y = 0 then none else some (.vint (x % y))

def eval : Nat → Env → Term → Option Val
  | 0, _, _ => none
  | _+1, _, .con i => some (.vint i)
  | _+1, env, .var n => env.lookup n
  | _+1, env, .lam n b => some (.vclos n b env)
  | _+1, _, .bltn b => some (.vbltn b [])
  | _+1, _, .err => none
  | fuel+1, env, .app g a =>
    match eval fuel env g, eval fuel env a with
    | some (.vclos n b cenv), some va => eval fuel ((n, va) :: cenv) b
    | some (.vbltn b args), some va =>
      match args ++ [va] with
      | [.vint x, .vint y] => compute b x y
      | args' => some (.vbltn b args')
    | _, _ => none

def run (prog : Term) (args : List Term) (fuel : Nat) : Option Int :=
  match eval fuel [] (args.foldl (fun acc a => .app acc a) prog) with
  | some (.vint i) => some i
  | _ => none

end Uplc

set_option maxRecDepth 1000000
open Uplc

theorem w6_sum6 : ∀ (x1 x2 x3 x4 x5 x6 : Int), Uplc.run (.lam "x1" (.lam "x2" (.lam "x3" (.lam "x4" (.lam "x5" (.lam "x6" (.app (.app (.bltn .Add) (.app (.app (.bltn .Add) (.app (.app (.bltn .Add) (.app (.app (.bltn .Add) (.app (.app (.bltn .Add) (.var "x1")) (.var "x2"))) (.var "x3"))) (.var "x4"))) (.var "x5"))) (.var "x6")))))))) [(.con x1), (.con x2), (.con x3), (.con x4), (.con x5), (.con x6)] 120 = some (x1 + x2 + x3 + x4 + x5 + x6) := by sorry
