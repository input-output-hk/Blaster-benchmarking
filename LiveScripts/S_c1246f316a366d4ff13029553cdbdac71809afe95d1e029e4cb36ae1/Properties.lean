import LiveScripts.Shared
import LiveScripts.S_c1246f316a366d4ff13029553cdbdac71809afe95d1e029e4cb36ae1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c1246f316a366d4ff13029553cdbdac71809afe95d1e029e4cb36ae1.script [ctx] 10000]
