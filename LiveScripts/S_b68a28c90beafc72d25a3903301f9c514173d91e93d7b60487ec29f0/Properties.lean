import LiveScripts.Shared
import LiveScripts.S_b68a28c90beafc72d25a3903301f9c514173d91e93d7b60487ec29f0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b68a28c90beafc72d25a3903301f9c514173d91e93d7b60487ec29f0.script [ctx] 10000]
