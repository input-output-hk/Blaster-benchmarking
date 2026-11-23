import LiveScripts.Shared
import LiveScripts.S_291f4cffc789ba9b4bbae373bd5286a92dc0e200e4f4cf3eb3fd57ee.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_291f4cffc789ba9b4bbae373bd5286a92dc0e200e4f4cf3eb3fd57ee.script [ctx] 10000]
