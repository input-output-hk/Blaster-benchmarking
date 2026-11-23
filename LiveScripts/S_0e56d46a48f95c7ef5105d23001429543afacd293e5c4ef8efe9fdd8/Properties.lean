import LiveScripts.Shared
import LiveScripts.S_0e56d46a48f95c7ef5105d23001429543afacd293e5c4ef8efe9fdd8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0e56d46a48f95c7ef5105d23001429543afacd293e5c4ef8efe9fdd8.script [ctx] 10000]
