import LiveScripts.Shared
import LiveScripts.S_553018fd910ce1466d9911fc749b8a325ef1fc9cb050da1ec946eed2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_553018fd910ce1466d9911fc749b8a325ef1fc9cb050da1ec946eed2.script [ctx] 10000]
