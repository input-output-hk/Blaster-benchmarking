import LiveScripts.Shared
import LiveScripts.S_549891877daf38e41b3e1cd4331eb70c666ea2375dbd127982c7db63.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_549891877daf38e41b3e1cd4331eb70c666ea2375dbd127982c7db63.script [ctx] 10000]
