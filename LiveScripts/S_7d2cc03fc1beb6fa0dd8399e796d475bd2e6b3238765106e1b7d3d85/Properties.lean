import LiveScripts.Shared
import LiveScripts.S_7d2cc03fc1beb6fa0dd8399e796d475bd2e6b3238765106e1b7d3d85.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7d2cc03fc1beb6fa0dd8399e796d475bd2e6b3238765106e1b7d3d85.script [ctx] 10000]
