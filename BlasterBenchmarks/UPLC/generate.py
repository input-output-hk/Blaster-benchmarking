#!/usr/bin/env python3
"""Generate the UPLC benchmark suite: a self-contained integer-UPLC evaluator +
two graded tracks of task files (Width = symbolic correctness on growing
expressions; Depth = concrete evaluation of growing computations). Each task file
is fully self-contained (Lean core only) so every tactic's isolated project can
elaborate it regardless of toolchain."""
import pathlib

PRELUDE = '''\
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
'''

HEADER = "\nset_option maxRecDepth 1000000\nopen Uplc\n\n"

# ---- Term builders (emit Lean Term syntax) ----
def V(n): return f'(.var "{n}")'
def C(i): return f'(.con {i})'
def add(a, b): return f'(.app (.app (.bltn .Add) {a}) {b})'
def sub(a, b): return f'(.app (.app (.bltn .Sub) {a}) {b})'
def mul(a, b): return f'(.app (.app (.bltn .Mul) {a}) {b})'
def lam(n, b): return f'(.lam "{n}" {b})'
def lams(vars, body):
    for v in reversed(vars): body = lam(v, body)
    return body

# ---- WIDTH track: symbolic correctness, growing expression size ----
def width_specs():
    W = []
    W.append(("w1_add", ["x", "y"], lambda: add(V("x"), V("y")), "x + y", 20))
    W.append(("w2_mul_distr", ["x", "y", "z"], lambda: mul(V("x"), add(V("y"), V("z"))), "x * (y + z)", 41))
    W.append(("w3_mul_over_add", ["x", "y", "z"], lambda: add(mul(V("x"), V("y")), mul(V("x"), V("z"))), "x*y + x*z", 60))
    W.append(("w4_linear", ["a", "x", "b"], lambda: add(mul(V("a"), V("x")), V("b")), "a*x + b", 60))
    W.append(("w5_quadratic", ["a", "x", "b", "c"],
              lambda: add(add(mul(V("a"), mul(V("x"), V("x"))), mul(V("b"), V("x"))), V("c")),
              "a*(x*x) + b*x + c", 120))
    vs = [f"x{i}" for i in range(1, 7)]
    def sum6():
        acc = V(vs[0])
        for v in vs[1:]: acc = add(acc, V(v))
        return acc
    W.append(("w6_sum6", vs, sum6, " + ".join(vs), 120))
    return W

# ---- DEPTH track: concrete deep evaluation (built by foldl def -> compact source) ----
def depth_specs():
    return [(f"d_sum_{N}", N, N * (N + 1) // 2, 8 * N + 100) for N in [4, 64, 256, 1024, 4096, 16384]]

def write_width(outdir):
    for name, vars, body, spec, fuel in width_specs():
        binders = " ".join(vars)
        arglist = "[" + ", ".join(f"(.con {v})" for v in vars) + "]"
        prog = lams(vars, body())   # wrap the expression in lambdas over its vars
        goal = f"∀ ({binders} : Int), Uplc.run {prog} {arglist} {fuel} = some ({spec})"
        f = outdir / "Width" / f"{name}.lean"
        f.parent.mkdir(parents=True, exist_ok=True)
        f.write_text(PRELUDE + HEADER + f"theorem {name} : {goal} := by sorry\n")

def write_depth(outdir):
    for name, N, expected, fuel in depth_specs():
        prog = (f"((List.range {N}).foldl "
                f"(fun acc k => Term.app (Term.app (Term.bltn Bltn.Add) acc) (Term.con (Int.ofNat (k+1)))) "
                f"(Term.con 0))")
        goal = f"Uplc.run {prog} [] {fuel} = some {expected}"
        f = outdir / "Depth" / f"{name}.lean"
        f.parent.mkdir(parents=True, exist_ok=True)
        f.write_text(PRELUDE + HEADER + f"theorem {name} : {goal} := by sorry\n")

if __name__ == "__main__":
    out = pathlib.Path(__file__).parent
    write_width(out); write_depth(out)
    ws = list((out / "Width").glob("*.lean")); ds = list((out / "Depth").glob("*.lean"))
    print(f"wrote {len(ws)} width + {len(ds)} depth task files")
