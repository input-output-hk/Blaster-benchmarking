import LiveScripts.Shared
import LiveScripts.S_99e5aacf401fed0eb0e2993d72d423947f42342e8f848353d03efe61.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_99e5aacf401fed0eb0e2993d72d423947f42342e8f848353d03efe61.script [redeemer, ctx] 10000]
