import LiveScripts.Shared
import LiveScripts.S_76b3f5e731783967d7aa9f2c6a2b03fc7e16a4d0c4e29e2dc7ead4ae.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_76b3f5e731783967d7aa9f2c6a2b03fc7e16a4d0c4e29e2dc7ead4ae.script [ctx] 10000]
