import LiveScripts.Shared
import LiveScripts.S_232fa560c51591672477859edd34ff885bf521535f54fc0511086d0a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_232fa560c51591672477859edd34ff885bf521535f54fc0511086d0a.script [ctx] 10000]
