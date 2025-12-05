import Solver.Command.Tactic

namespace BlasterBenchmarks.CEX
/-! # This benchmark mainly targets counterexample generation.
      Hence all the theorems listed below must be falsified.
-/
set_option warn.sorry false

inductive Either (α : Type u) (β : Type v) where
 | Left : α -> Either α β
 | Right : β -> Either α β

instance [BEq a] [BEq b] : BEq (Either a b) where
  beq | Either.Left a1, Either.Left a2 => a1 != a2 -- bug
      | Either.Right b1, Either.Right b2 => b1 == b2
      | _, _ => false

theorem Either.eq_of_beq (h : ∀ (α : Type) (a b : α), [BEq α] → a == b → a = b) :
        (∀ (α : Type) (β : Type) (x y : Either α β), [BEq α] → [BEq β] → x == y → x = y) := by sorry


abbrev IdentName := String
mutual
  inductive Attribute (α : Type u) where
  | Named (n : IdentName)
  | Pattern (p : List (Term α))
  | Qid (n : IdentName) (p : Except (Option (Term α)) (List (Attribute α)))

  inductive Term (α : Type u) where
  | Ident (s : IdentName)
  | Seq (x : List α)
  | App (nm : IdentName) (args : List (Term α))
  | Annotated (t : Term α) (annot : List (Attribute α))
end

def sizeOfTerm (t : Term α) : Nat :=
  match t with
  | .Ident _ => 1
  | .Seq xs => List.length xs
  | .App _ args => List.length args
  | .Annotated t' _ => 1 + sizeOfTerm t'

theorem sizeOfTerm_lt_eight : ∀ (α : Type) (x : Term α), sizeOfTerm x < 5 := by sorry

theorem hof_arith_invalid1 (h : ∀ (x : Int) (f : Int → Nat), f x > 2) (x y : Int) (f : Int → Nat) :
  f x + f y > 20 := by sorry

theorem hof_arith_invalid2 (h : ∀ (β : Type) (x : Term (List β)) (f : Term (List β) → Nat), f x > 0) :
  ∀ (α : Type) (x y : Term (List α)) (f : Term (List α) → Nat), f x + f y > 20 := by sorry

theorem hof_arith_invalid3 (h : ∀ (β : Type) (x : Term (List β)) (g : Term (List β) → Nat), g x > 10) :
  ∀ (α : Type) (x y : Term (List α)) (f : Term (List α) → Nat), f x + f y > 30 := by sorry


inductive NatGroup where
 | first (n : Nat) (h1 : n ≥ 10) (h2 : n < 100): NatGroup
 | second (n : Nat) (h1 : n > 100) (h2 : n < 200) : NatGroup
 | next (n : NatGroup)

def isFirst (x : NatGroup) : Bool :=
  match x with
  | .first .. => true
  | _ => false

def isSecond (x : NatGroup) : Bool :=
  match x with
  | .second .. => true
  | _ => false


def toFirst (x : NatGroup) : Nat :=
  match x with
  | .first n _ _ => n
  | _ => 0

def toSecond (x : NatGroup) : Nat :=
  match x with
  | .second n _ _ => n
  | _ => 0

def isNextFirst (x : NatGroup) : Bool :=
  let rec visit (x : NatGroup) : Bool :=
    match x with
    | .first .. => true
    | .second .. => false
    | .next n => visit n
  match x with
  | .next n => visit n
  | _ => false

def toNextFirst (x : NatGroup) : Nat :=
  let rec visit (x : NatGroup) : Nat :=
    match x with
    | .first n _ _ => n
    | .second .. => 0
    | .next n => visit n
  match x with
  | .next n => visit n
  | _ => 0

theorem NatGroup.isFirst_invalid (x : NatGroup) :
  isFirst x → toFirst x > 20 ∧ toFirst x < 100 := by sorry

theorem NatGroup.isSecond_invalid (x : NatGroup) :
  isSecond x → toSecond x > 200 ∧ toSecond x < 300 := by sorry

theorem NatGroup.isNextFirst_invalid (x : NatGroup) :
  isNextFirst x → toNextFirst x > 20 ∧ toNextFirst x < 100 := by sorry

theorem List.invalid_length (x : Nat) (xs : List Nat) :
   List.length xs + 2 = List.length (x :: xs) := by sorry

theorem String.invalid_length (s1 s2 : String) :
  String.length s1 + String.length s2 > String.length (String.append s1 s2) := by sorry


mutual
  def isEven : Nat → Bool
    | 0 => true
    | n+1 => isOdd n

  def isOdd : Nat → Bool
    | 0 => false
    | n+1 => isEven n
end

theorem isEven_isOdd_invalid (n : Nat) : isEven (n+1) = ¬ isOdd n := by sorry
theorem isEven_isEven_invalid (n : Nat) : isEven (n+2) → ¬ isEven n := by sorry

theorem hof_length_invalid (xs : List Nat) (f : List Nat → Nat) (c : Bool) :
   f xs < 10 → (if c then f else List.length) xs < 10  := by sorry

theorem map_length_invalid (xs : List (List Nat)) :
  !(List.isEmpty xs) → List.head! (List.map List.length xs) < 0 := by sorry


inductive GenericGroup (α : Type) [LE α] where
 | first (n1 : α) (n2 : α) (h1 : n1 ≥ n2) : GenericGroup α
 | next (n : GenericGroup α)

def sizeOfGenericGroup [LE α] (a : GenericGroup α) : Nat :=
  match a with
  | .first .. => 1
  | .next n => 1 + (sizeOfGenericGroup n)

theorem GenericGroup_size_invalid1 (α : Type) [LE α] (a : GenericGroup α) :
  sizeOfGenericGroup a ≥ 10 := by sorry

theorem GenericGroup_size_invalid2 (α : Type) [LE α] (a : GenericGroup α) :
  sizeOfGenericGroup a < 10 := by sorry

mutual
 structure FunGroup (α : Type) [LE α] where
   f : α → GenericGroupFun α

inductive GenericGroupFun (α : Type) [LE α] where
 | first (n1 : α) (n2 : α) (h1 : n1 ≥ n2) : GenericGroupFun α
 | next (f : FunGroup α) (n1 : α) (n2 : GenericGroupFun α) : GenericGroupFun α
end

def sizeOfGenericGroupFun [LE α] [LE (GenericGroupFun α)] [DecidableLE (GenericGroupFun α)] (a : GenericGroupFun α) : Nat :=
  match a with
  | .first .. => 1
  | .next fg n1 n2 =>
          if fg.f n1 ≥ n2 then
            1 + sizeOfGenericGroupFun n2
          else 2

theorem GenericGroupFun_size_invalid (α : Type) [LE α] [LE (GenericGroupFun α)] [DecidableLE (GenericGroupFun α)] :
  ∀ (a : GenericGroupFun α), sizeOfGenericGroupFun a ≥ 10 := by sorry


end BlasterBenchmarks.CEX
