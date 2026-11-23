import LiveScripts.Shared
import LiveScripts.S_bdceb595b8754726b3efe3ab0f81c76cbda1a0a0d3653bb8fad89bb2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bdceb595b8754726b3efe3ab0f81c76cbda1a0a0d3653bb8fad89bb2.script [redeemer, ctx] 10000]
