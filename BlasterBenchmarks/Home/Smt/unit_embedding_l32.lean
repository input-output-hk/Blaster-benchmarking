/- Portable goal adapted from https://github.com/ufmg-smite/lean-smt/blob/79ef7b3d5e06608d031d75b6d015949b90016875/Test/Unit/Embedding.lean#L32
   The original proof is replaced by the tactic under test. -/
theorem unit_embedding_l32 (p q : Bool) (h : p && q) (h2 : p || q) : (1 : Int) + 1 = 2 := by sorry
