import LiveScripts.Shared
import LiveScripts.S_aef3aab9420bfeb6e655bc30065403611577620904c1ec40cc5421cb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_aef3aab9420bfeb6e655bc30065403611577620904c1ec40cc5421cb.script [ctx] 10000]
