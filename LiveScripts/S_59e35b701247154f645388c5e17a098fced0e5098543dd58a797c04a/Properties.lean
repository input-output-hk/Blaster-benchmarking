import LiveScripts.Shared
import LiveScripts.S_59e35b701247154f645388c5e17a098fced0e5098543dd58a797c04a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_59e35b701247154f645388c5e17a098fced0e5098543dd58a797c04a.script [ctx] 10000]
