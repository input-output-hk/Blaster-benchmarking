import LiveScripts.Shared
import LiveScripts.S_9c81804c3204209c505cf6fd8c91b77a93813c523cb86e6d7de71b65.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9c81804c3204209c505cf6fd8c91b77a93813c523cb86e6d7de71b65.script [datum, redeemer, ctx] 10000]
