import LiveScripts.Shared
import LiveScripts.S_edfff663d37fc5f9753bc4222e0da2bfe08aa48db0837d2c329adeb3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_edfff663d37fc5f9753bc4222e0da2bfe08aa48db0837d2c329adeb3.script [datum, redeemer, ctx] 10000]
