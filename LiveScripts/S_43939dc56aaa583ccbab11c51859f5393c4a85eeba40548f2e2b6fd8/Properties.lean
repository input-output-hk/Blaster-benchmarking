import LiveScripts.Shared
import LiveScripts.S_43939dc56aaa583ccbab11c51859f5393c4a85eeba40548f2e2b6fd8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_43939dc56aaa583ccbab11c51859f5393c4a85eeba40548f2e2b6fd8.script [ctx] 10000]
