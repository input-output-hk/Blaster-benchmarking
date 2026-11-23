import LiveScripts.Shared
import LiveScripts.S_54f9290a88a407b2a1b9ce2c9a96142d02a8d0b686a634346a00d1ef.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_54f9290a88a407b2a1b9ce2c9a96142d02a8d0b686a634346a00d1ef.script [ctx] 10000]
