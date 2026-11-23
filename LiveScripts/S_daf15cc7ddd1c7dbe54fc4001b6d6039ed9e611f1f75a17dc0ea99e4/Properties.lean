import LiveScripts.Shared
import LiveScripts.S_daf15cc7ddd1c7dbe54fc4001b6d6039ed9e611f1f75a17dc0ea99e4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_daf15cc7ddd1c7dbe54fc4001b6d6039ed9e611f1f75a17dc0ea99e4.script [datum, redeemer, ctx] 10000]
