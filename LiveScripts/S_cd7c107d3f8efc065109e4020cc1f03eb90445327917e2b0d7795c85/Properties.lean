import LiveScripts.Shared
import LiveScripts.S_cd7c107d3f8efc065109e4020cc1f03eb90445327917e2b0d7795c85.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cd7c107d3f8efc065109e4020cc1f03eb90445327917e2b0d7795c85.script [ctx] 10000]
