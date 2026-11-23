import LiveScripts.Shared
import LiveScripts.S_44e29c321ea677c4cf3e708d1ec42d5284f90671f39cbdd2c1540cc2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_44e29c321ea677c4cf3e708d1ec42d5284f90671f39cbdd2c1540cc2.script [ctx] 10000]
