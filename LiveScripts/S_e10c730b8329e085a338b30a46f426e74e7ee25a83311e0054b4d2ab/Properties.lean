import LiveScripts.Shared
import LiveScripts.S_e10c730b8329e085a338b30a46f426e74e7ee25a83311e0054b4d2ab.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e10c730b8329e085a338b30a46f426e74e7ee25a83311e0054b4d2ab.script [ctx] 10000]
