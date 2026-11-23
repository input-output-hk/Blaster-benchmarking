import LiveScripts.Shared
import LiveScripts.S_e233fdff34c4011dfad9f27b3df39674ba9535bf5cdc735fbc8e32cc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e233fdff34c4011dfad9f27b3df39674ba9535bf5cdc735fbc8e32cc.script [datum, redeemer, ctx] 10000]
