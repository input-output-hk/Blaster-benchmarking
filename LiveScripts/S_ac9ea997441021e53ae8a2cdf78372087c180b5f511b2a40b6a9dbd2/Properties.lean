import LiveScripts.Shared
import LiveScripts.S_ac9ea997441021e53ae8a2cdf78372087c180b5f511b2a40b6a9dbd2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ac9ea997441021e53ae8a2cdf78372087c180b5f511b2a40b6a9dbd2.script [ctx] 10000]
