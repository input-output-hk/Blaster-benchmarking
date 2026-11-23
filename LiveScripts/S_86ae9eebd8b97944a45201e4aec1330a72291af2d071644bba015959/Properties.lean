import LiveScripts.Shared
import LiveScripts.S_86ae9eebd8b97944a45201e4aec1330a72291af2d071644bba015959.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_86ae9eebd8b97944a45201e4aec1330a72291af2d071644bba015959.script [datum, redeemer, ctx] 10000]
