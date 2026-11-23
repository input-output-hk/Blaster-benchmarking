import LiveScripts.Shared
import LiveScripts.S_e3f0656596e2a5eb99963215172e6f84f7fdf55079235b502206b51a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e3f0656596e2a5eb99963215172e6f84f7fdf55079235b502206b51a.script [ctx] 10000]
