import LiveScripts.Shared
import LiveScripts.S_c25f7962dcbb4f0837de40ab625f5df72a01f23a61eb4021ba6e8ad0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c25f7962dcbb4f0837de40ab625f5df72a01f23a61eb4021ba6e8ad0.script [datum, redeemer, ctx] 10000]
