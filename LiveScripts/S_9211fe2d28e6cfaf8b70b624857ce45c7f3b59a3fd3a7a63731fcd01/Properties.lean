import LiveScripts.Shared
import LiveScripts.S_9211fe2d28e6cfaf8b70b624857ce45c7f3b59a3fd3a7a63731fcd01.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9211fe2d28e6cfaf8b70b624857ce45c7f3b59a3fd3a7a63731fcd01.script [redeemer, ctx] 10000]
