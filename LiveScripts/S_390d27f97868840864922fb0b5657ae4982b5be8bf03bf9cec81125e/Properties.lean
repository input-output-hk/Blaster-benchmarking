import LiveScripts.Shared
import LiveScripts.S_390d27f97868840864922fb0b5657ae4982b5be8bf03bf9cec81125e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_390d27f97868840864922fb0b5657ae4982b5be8bf03bf9cec81125e.script [ctx] 10000]
