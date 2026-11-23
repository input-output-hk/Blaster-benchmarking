import LiveScripts.Shared
import LiveScripts.S_1ceaf5d8202b97ea49ffa38c844115c7ea77441fc71627778bd3b0bc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1ceaf5d8202b97ea49ffa38c844115c7ea77441fc71627778bd3b0bc.script [ctx] 10000]
