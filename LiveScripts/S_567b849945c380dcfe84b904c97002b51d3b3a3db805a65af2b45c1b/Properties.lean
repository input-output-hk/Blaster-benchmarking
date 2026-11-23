import LiveScripts.Shared
import LiveScripts.S_567b849945c380dcfe84b904c97002b51d3b3a3db805a65af2b45c1b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_567b849945c380dcfe84b904c97002b51d3b3a3db805a65af2b45c1b.script [ctx] 10000]
