import LiveScripts.Shared
import LiveScripts.S_23a3fa6ce5fa6c402d945d89224e8cf9827eab3f7098cd8e045b0c79.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_23a3fa6ce5fa6c402d945d89224e8cf9827eab3f7098cd8e045b0c79.script [datum, redeemer, ctx] 10000]
