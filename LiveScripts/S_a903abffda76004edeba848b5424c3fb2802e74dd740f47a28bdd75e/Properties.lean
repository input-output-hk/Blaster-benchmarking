import LiveScripts.Shared
import LiveScripts.S_a903abffda76004edeba848b5424c3fb2802e74dd740f47a28bdd75e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a903abffda76004edeba848b5424c3fb2802e74dd740f47a28bdd75e.script [ctx] 10000]
