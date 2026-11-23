import LiveScripts.Shared
import LiveScripts.S_2618e94cdb06792f05ae9b1ec78b0231f4b7f4215b1b4cf52e6342de.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2618e94cdb06792f05ae9b1ec78b0231f4b7f4215b1b4cf52e6342de.script [datum, redeemer, ctx] 10000]
