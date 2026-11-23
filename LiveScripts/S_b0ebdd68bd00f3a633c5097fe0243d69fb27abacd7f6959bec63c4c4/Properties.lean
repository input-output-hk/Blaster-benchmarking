import LiveScripts.Shared
import LiveScripts.S_b0ebdd68bd00f3a633c5097fe0243d69fb27abacd7f6959bec63c4c4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b0ebdd68bd00f3a633c5097fe0243d69fb27abacd7f6959bec63c4c4.script [datum, redeemer, ctx] 10000]
