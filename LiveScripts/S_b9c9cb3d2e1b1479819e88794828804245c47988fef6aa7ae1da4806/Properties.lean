import LiveScripts.Shared
import LiveScripts.S_b9c9cb3d2e1b1479819e88794828804245c47988fef6aa7ae1da4806.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b9c9cb3d2e1b1479819e88794828804245c47988fef6aa7ae1da4806.script [datum, redeemer, ctx] 10000]
