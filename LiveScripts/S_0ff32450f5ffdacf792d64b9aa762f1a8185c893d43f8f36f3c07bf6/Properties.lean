import LiveScripts.Shared
import LiveScripts.S_0ff32450f5ffdacf792d64b9aa762f1a8185c893d43f8f36f3c07bf6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0ff32450f5ffdacf792d64b9aa762f1a8185c893d43f8f36f3c07bf6.script [ctx] 10000]
