import LiveScripts.Shared
import LiveScripts.S_c727443d77df6cff95dca383994f4c3024d03ff56b02ecc22b0f3f65.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c727443d77df6cff95dca383994f4c3024d03ff56b02ecc22b0f3f65.script [datum, redeemer, ctx] 10000]
