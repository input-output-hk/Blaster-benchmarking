import LiveScripts.Shared
import LiveScripts.S_e4214b7cce62ac6fbba385d164df48e157eae5863521b4b67ca71d86.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e4214b7cce62ac6fbba385d164df48e157eae5863521b4b67ca71d86.script [redeemer, ctx] 10000]
