import LiveScripts.Shared
import LiveScripts.S_ea07b733d932129c378af627436e7cbc2ef0bf96e0036bb51b3bde6b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ea07b733d932129c378af627436e7cbc2ef0bf96e0036bb51b3bde6b.script [datum, redeemer, ctx] 10000]
