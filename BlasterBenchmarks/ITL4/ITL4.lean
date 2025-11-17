-- This is the Intro to Logic for Lean4 examples

namespace BlasterBenchmarks.ITL4
section And
  theorem AndIntro_01 (P : Prop)(todo_list : P) : P := by sorry
  theorem AndIntro_02 (P S : Prop)(p: P)(s : S) : P ∧ S := by sorry
  theorem AndIntro_03 (A I O U : Prop)(a : A)(i : I)(o : O)(u : U) : (A ∧ I) ∧ O ∧ U := by sorry
  theorem AndIntro_04 (P S : Prop)(vm: P ∧ S) : P := by sorry
  theorem AndIntro_05 (P Q : Prop)(h: P ∧ Q) : Q := by sorry
  theorem AndIntro_06 (A I O U : Prop)(h1 : A ∧ I)(h2 : O ∧ U) : A ∧ U := by sorry
  theorem AndIntro_07 (C L : Prop)(h: (L ∧ (((L ∧ C) ∧ L) ∧ L ∧ L ∧ L)) ∧ (L ∧ L) ∧ L) : C := by sorry
  theorem AndIntro_08 (A C I O P S U : Prop)(h: ((P ∧ S) ∧ A) ∧ ¬I ∧ (C ∧ ¬O) ∧ ¬U) : A ∧ C ∧ P ∧ S := by sorry
end And

section Iff
  theorem IffIntro_01 (J S : Prop) (hsj: S → J) (hjs: J → S) : S ↔ J := by sorry
  theorem IffIntro_02 (B P : Prop) (h : B ↔ ¬P) : (B → ¬P) ∧ (¬P → B) := by sorry
  theorem IffIntro_03 (P Q R  : Prop) (h1 : Q ↔ R)(h2 : P → Q) : P → R := by sorry
  theorem IffIntro_04 (P Q R : Prop) (h1 : P ↔ R)(h2 : P → Q) : R → Q := by sorry
  theorem IffIntro_05 (A C L P : Prop)
    (h1 : L ↔ P)
    (h2 : ¬((A → C ∨ ¬P) ∧ (P ∨ A → ¬C) → (P → C)) ↔ A ∧ C ∧ ¬P)
    : ¬((A → C ∨ ¬L) ∧ (L ∨ A → ¬C) → (L → C)) ↔ A ∧ C ∧ ¬L := by sorry
  theorem IffIntro_06 (P Q R : Prop) (h : P ∨ Q ∨ R → ¬(P ∧ Q ∧ R)) : (P ∨ Q) ∨ R → ¬((P ∧ Q) ∧ R) := by sorry
  theorem IffIntro_07 (P Q R : Prop): (P ∧ Q ↔ R ∧ Q) ↔ Q → (P ↔ R) := by sorry
end Iff

section Imp
  theorem ImpIntro_01 (P C: Prop)(p: P)(bakery_service : P → C) : C := by sorry
  theorem ImpIntro_02 (C: Prop) : C → C := by sorry
  theorem ImpIntro_03 (I S: Prop) : I ∧ S → S ∧ I := by sorry
  theorem ImpIntro_04 (C A S: Prop) (h1 : C → A) (h2 : A → S) : C → S := by sorry
  theorem ImpIntro_05 (P Q R S T U: Prop) (p : P) (h1 : P → Q) (h2 : Q → R) (h3 : Q → T) (h4 : S → T) (h5 : T → U) : U := by sorry
  theorem ImpIntro_06 (C D S: Prop) (h : C ∧ D → S) : C → D → S := by sorry
  theorem ImpIntro_07 (C D S: Prop) (h : C → D → S) : C ∧ D → S := by sorry
  theorem ImpIntro_08 (C D S : Prop) (h : (S → C) ∧ (S → D)) : S → C ∧ D := by sorry
  theorem ImpIntro_09 (R S : Prop) : R → (S → R) ∧ (¬S → R) := by sorry
end Imp

section Not
  theorem NotIntro_01 : ¬False := by sorry
  theorem NotIntro_02 (B S : Prop)(h : ¬S) : S → B := by sorry
  theorem NotIntro_03 (P : Prop)(p : P) : ¬¬P := by sorry
  theorem NotIntro_04 (L : Prop) : ¬(L ∧ ¬L) := by sorry
  theorem NotIntro_05 (B S : Prop)(h1 : B → S)(h2 : ¬S) : ¬B := by sorry
  theorem NotIntro_06 (A : Prop) (h: A → ¬A) : ¬A := by sorry
  theorem NotIntro_07 (B C : Prop) (h: ¬(B → C)) : ¬C := by sorry
  theorem NotIntro_08 (C S : Prop) (s: S) : ¬(¬S ∧ C) := by sorry
  theorem NotIntro_09 (A P : Prop) (h : P → ¬A) : ¬(P ∧ A) := by sorry
  theorem NotIntro_10 (A P : Prop) (h: ¬(P ∧ A)) : P → ¬A := by sorry
  theorem NotIntro_11 (A : Prop)(h : ¬¬¬A) : ¬A := by sorry
  theorem NotIntro_12 (B C : Prop) (h : ¬(B → C)) : ¬¬B := by sorry
end Not

section Or
 theorem OrIntro_01 (O S : Prop)(s : S) : S ∨ O := by sorry
 theorem OrIntro_02 (O S : Prop)(s : S) : K ∨ S := by sorry
 theorem OrIntro_03 (B C I : Prop)(h1 : C → B)(h2 : I → B)(h3 : C ∨ I) : B := by sorry
 theorem OrIntro_04 (C O : Prop)(h : C ∨ O) : O ∨ C := by sorry
 theorem OrIntro_05 (C J R : Prop)(h1 : C → J)(h2 : C ∨ R) : J ∨ R := by sorry
 theorem OrIntro_06 (G H U : Prop)(h : G ∨ H ∧ U) : (G ∨ H) ∧ (G ∨ U) := by sorry
 theorem OrIntro_07 (G H U : Prop)(h : G ∧ (H ∨ U)) : (G ∧ H) ∨ (G ∧ U) := by sorry
 theorem OrIntro_08 (I K P : Prop)(h : K → P) : K ∨ I → I ∨ P := by sorry
end Or

end BlasterBenchmarks.ITL4
