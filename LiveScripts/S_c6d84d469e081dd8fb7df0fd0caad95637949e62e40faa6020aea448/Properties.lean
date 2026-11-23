import LiveScripts.Shared
import LiveScripts.S_c6d84d469e081dd8fb7df0fd0caad95637949e62e40faa6020aea448.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c6d84d469e081dd8fb7df0fd0caad95637949e62e40faa6020aea448.script [ctx] 10000]
