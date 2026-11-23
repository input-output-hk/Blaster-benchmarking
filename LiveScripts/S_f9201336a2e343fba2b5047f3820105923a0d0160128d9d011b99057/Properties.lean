import LiveScripts.Shared
import LiveScripts.S_f9201336a2e343fba2b5047f3820105923a0d0160128d9d011b99057.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f9201336a2e343fba2b5047f3820105923a0d0160128d9d011b99057.script [ctx] 10000]
