import LiveScripts.Shared
import LiveScripts.S_f74fc72ba0dc25cec15dc12466cd4343bd719ab485b6b64b695c9c2e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f74fc72ba0dc25cec15dc12466cd4343bd719ab485b6b64b695c9c2e.script [datum, redeemer, ctx] 10000]
