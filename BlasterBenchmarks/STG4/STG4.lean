import Mathlib.Data.Set.Basic
import Mathlib.Data.Set.Lattice
import Mathlib.Tactic.Common
import Mathlib.Tactic.Have

import Solver.Command.Tactic
open Set
section Combo
  theorem compl_union : ∀ (A B : Set U), (A ∪ B)ᶜ = Aᶜ ∩ Bᶜ := by blaster
  theorem compl_inter : ∀ (A B : Set U), (A ∩ B)ᶜ = Aᶜ ∪ Bᶜ := by blaster
  theorem inter_distrib_left : ∀ (A B C : Set U), A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C) := by blaster
  theorem union_distrib_left : ∀ (A B C : Set U), A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C) := by blaster
  theorem union_sub_inter_sub : ∀ (A B C : Set U) (h1 : A ∪ C ⊆ B ∪ C) (h2 : A ∩ C ⊆ B ∩ C), A ⊆ B := by blaster
end Combo

section Comp
  theorem contra : ∀ {A B : Set U} {x : U} (h1 : x ∈ A) (h2 : x ∉ B), ¬A ⊆ B := by blaster
  theorem mem_compl_iff (A : Set U) (x : U) : x ∈ Aᶜ ↔ x ∉ A := by blaster
  theorem compl_subset_compl_of_subs : ∀ {A B : Set U} (h1 : A ⊆ B), Bᶜ ⊆ Aᶜ := by blaster
  theorem compl_compl2 : ∀ (A : Set U), Aᶜᶜ = A := by blaster
  theorem comp_sub_iff : ∀ (A B : Set U), A ⊆ B ↔ Bᶜ ⊆ Aᶜ := by blaster
end Comp

section DemoWorld
  theorem helloWorld (h : x = 2) (g: y = 4) : x + x = y := by blaster
end DemoWorld

section FamCombo
  theorem comp_union : ∀ (F : Set (Set U)), (⋃₀ F)ᶜ = ⋂₀ {s | sᶜ ∈ F} := by blaster
  theorem comp_inter : ∀ (F : Set (Set U)), (⋂₀ F)ᶜ = ⋃₀ {s | sᶜ ∈ F} := by blaster
  theorem common_elt : ∀ (F G : Set (Set U)) (h1 : ∀ s ∈ F, ∃ t ∈ G, s ⊆ t) (h2 : ∃ s ∈ F, ∀ t ∈ G, t ⊆ s),
    ∃ u, u ∈ F ∩ G := by blaster
  theorem three_fam: ∀ (F G H : Set (Set U)) (h1 : ∀ s ∈ F, ∃ u ∈ G, s ∩ u ∈ H), (⋃₀ F) ∩ (⋂₀ G) ⊆ ⋃₀ H := by blaster
  theorem union_int_comp_union : ∀ (F G : Set (Set U)), (⋃₀ F) ∩ (⋃₀ G)ᶜ ⊆ ⋃₀ (F ∩ Gᶜ) := by blaster
  theorem union_int_union: ∀ (F G : Set (Set U)) (h1 : ⋃₀ (F ∩ Gᶜ) ⊆ (⋃₀ F) ∩ (⋃₀ G)ᶜ),
    (⋃₀ F) ∩ (⋃₀ G) ⊆ ⋃₀ (F ∩ G) := by blaster
  theorem union_int_comp_int : ∀ (F G : Set (Set U)), (⋃₀ F) ∩ (⋂₀ G)ᶜ ⊆ ⋃₀ {s | ∃ u ∈ F, ∃ v ∈ G, s = u ∩ vᶜ} := by blaster
  theorem singleton : ∀ (A : Set U) (h1 : ∀ F, (⋃₀ F = A → A ∈ F)), ∃ x, A = {x} := by
    -- intro A h1
    -- have h2 := h1 {s | ∃ x ∈ A, s = {x}}
    -- have h3 : ⋃₀ {s | ∃ x ∈ A, s = {x}} = A
    -- ext x
    -- apply Iff.intro
    -- intro h3
    -- obtain ⟨t, ht⟩ := h3
    -- rewrite [mem_setOf] at ht
    -- obtain ⟨y, hy⟩ := ht.left
    -- rewrite [hy.right] at ht
    -- rewrite [mem_singleton_iff] at ht
    -- rewrite [ht.right]
    -- exact hy.left
    -- intro h3
    -- use {x}
    -- apply And.intro
    -- rewrite [mem_setOf]
    -- use x
    -- rewrite [mem_singleton_iff]
    -- rfl
    -- have h4 := h2 h3
    -- rewrite [mem_setOf] at h4
    -- obtain ⟨y, hy⟩ := h4
    -- use y
    -- exact hy.right
    sorry -- blaster returns a spurious counterexample!!
  theorem setOf_mem (x : U) (P : U → Prop) (h : P x) : x ∈ {y | P y} := by
    blaster
  theorem setOf_subset :∀ (A : Set U), {x | x ∈ A} = A := by
    blaster
  theorem setOf_eq (P Q : U → Prop) (h : ∀ x, P x ↔ Q x) : {x | P x} = {x | Q x} := by
    blaster
  theorem setOf_inter (A B : Set U) : {x | x ∈ A ∧ x ∈ B} = A ∩ B := by
    blaster

-- Test singleton set operations
theorem singleton_subset (x : U) (A : Set U) (h : x ∈ A) :
  Set.singleton x ⊆ A := by
  blaster

theorem mem_singleton (x : U) :
  x ∈ Set.singleton x := by
  blaster

theorem singleton_eq (x y : U) :
  Set.singleton x = Set.singleton y → x = y := by
  blaster

end FamCombo

section FamInter
  theorem inter_sub : ∀ (A : Set U) (F : Set (Set U)) (h1 : A ∈ F), ⋂₀ F ⊆ A := by blaster
  theorem inter_sub_inter : ∀ (F G : Set (Set U)) (h1 : F ⊆ G), ⋂₀ G ⊆ ⋂₀ F := by blaster
  theorem inter_pair : ∀ (A B : Set U), A ∩ B = ⋂₀ {A, B} := by blaster
  theorem inter_union : ∀ (F G : Set (Set U)), ⋂₀ (F ∪ G) = (⋂₀ F) ∩ (⋂₀ G) := by blaster
  theorem sub_inter : ∀ (A : Set U) (F : Set (Set U)), A ⊆ ⋂₀ F ↔ ∀ s ∈ F, A ⊆ s := by blaster
  theorem eltwise_union : ∀ (A : Set U) (F G : Set (Set U)) (h1 : ∀ s ∈ F, A ∪ s ∈ G), ⋂₀ G ⊆ A ∪ (⋂₀ F) := by blaster
end FamInter

section FamUnion
  theorem prove_exists : ∀ (A : Set U), ∃ s, s ⊆ A := by blaster
  theorem sub_union : ∀ (A : Set U) (F : Set (Set U)) (h1 : A ∈ F), A ⊆ ⋃₀ F := by blaster
  theorem union_sub_union : ∀ (F G : Set (Set U)) (h1 : F ⊆ G), ⋃₀ F ⊆ ⋃₀ G := by blaster
  theorem union_pair : ∀ (A B : Set U), A ∪ B = ⋃₀ {A, B} := by blaster
  theorem union_union : ∀ (F G : Set (Set U)), ⋃₀ (F ∪ G) = (⋃₀ F) ∪ (⋃₀ G) := by blaster
  theorem union_sub : ∀ (A : Set U) (F : Set (Set U)), ⋃₀ F ⊆ A ↔ ∀ s ∈ F, s ⊆ A := by blaster
  theorem eltwise_inter : ∀ (A : Set U) (F : Set (Set U)), A ∩ (⋃₀ F) = ⋃₀ {s | ∃ u ∈ F, s = A ∩ u} := by blaster
end FamUnion

section Inter
  theorem and_thm : ∀  (x : U) (A B : Set U) (h : x ∈ A ∧ x ∈ B), x ∈ A := by blaster
  theorem elt_inter_elt_right (x : U) (A B : Set U) (h : x ∈ A ∩ B) : x ∈ B := by blaster
  theorem inter_sub_left (A B : Set U) : A ∩ B ⊆ A := by blaster
  theorem prove_and (x : U) (A B : Set U) (h1 : x ∈ A) (h2 : x ∈ B) : x ∈ A ∩ B := by blaster
  theorem sub_int : ∀ (A B C : Set U) (h1 : A ⊆ B) (h2 : A ⊆ C), A ⊆ B ∩ C := by blaster
  theorem inter_subset_swap (A B : Set U) : A ∩ B ⊆ B ∩ A := by blaster
  theorem inter_comm (A B : Set U) : A ∩ B = B ∩ A := by blaster
  theorem inter_assoc : ∀ (A B C : Set U), (A ∩ B) ∩ C = A ∩ (B ∩ C) := by blaster
end Inter

section Subset
  theorem subset_exact : ∀ (x : U) (A : Set U) (h : x ∈ A), x ∈ A := by blaster
  theorem sub_hyp : ∀ (x : U) (A B : Set U) (h1 : A ⊆ B) (h2 : x ∈ A), x ∈ B := by blaster
  theorem subset_have : ∀ (x : U) (A B C : Set U) (h1 : A ⊆ B) (h2 : B ⊆ C) (h3 : x ∈ A), x ∈ C := by blaster
  theorem subset_imp : ∀ {x : U} {A B C : Set U} (h1 : A ⊆ B) (h2 : x ∈ B → x ∈ C), x ∈ A → x ∈ C := by blaster
  theorem Subset.refl (A : Set U) : A ⊆ A := by blaster
  theorem Subset.trans : ∀ {A B C : Set U} (h1 : A ⊆ B) (h2 : B ⊆ C),  A ⊆ C := by blaster
end Subset

section Union
  theorem union_or : ∀ (x : U) (A B : Set U) (h : x ∈ A), x ∈ A ∨ x ∈ B := by blaster
  theorem sub_union_2 (A B : Set U) : B ⊆ A ∪ B := by blaster
  theorem union_cases : ∀ (A B C : Set U) (h1 : A ⊆ C) (h2 : B ⊆ C), A ∪ B ⊆ C := by blaster
  theorem union_subset_swap (A B : Set U) : A ∪ B ⊆ B ∪ A := by blaster
  theorem union_comm (A B : Set U) : A ∪ B = B ∪ A := by blaster
  theorem union_assoc : ∀ (A B C : Set U), (A ∪ B) ∪ C = A ∪ (B ∪ C) := by blaster
end Union

theorem powerset_mono : ∀ {α : Type} {A B : Set α} (h : A ⊆ B),
  𝒫 A ⊆ 𝒫 B := by blaster (dump-smt-lib: 1)

theorem powerset_powerset_mono : ∀ {α : Type} {A B : Set α} (h : A ⊆ B),
  𝒫 (𝒫 A) ⊆ 𝒫 (𝒫 B) := by blaster (dump-smt-lib: 1)

theorem schroeder_bernstein {α β : Type}
  (f : α → β) (g : β → α)
  (hf : ∀ x y : α, f x = f y → x = y)  -- f is injective
  (hg : ∀ x y : β, g x = g y → x = y)  -- g is injective
  : ∃ h : α → β, (∀ x y : α, h x = h y → x = y) ∧ (∀ y : β, ∃ x : α, h x = y) := by blaster (dump-smt-lib: 1)
