import LiveScripts.Shared
import LiveScripts.S_26b49350b7ffd1f3a1d15d0e234603b29077dea9b392dd57d3e44115.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_26b49350b7ffd1f3a1d15d0e234603b29077dea9b392dd57d3e44115.script [ctx] 10000]
