import LiveScripts.Shared
import LiveScripts.S_0813a6308bd6fb301d8b12801fe3bb3cc598732b8b62b2f485604177.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0813a6308bd6fb301d8b12801fe3bb3cc598732b8b62b2f485604177.script [datum, redeemer, ctx] 10000]
