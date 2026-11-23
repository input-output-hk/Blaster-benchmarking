import LiveScripts.Shared
import LiveScripts.S_32bb31bbf569390b4637d9287d66e9d445ee87ab058b3e2e5c43b1d8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_32bb31bbf569390b4637d9287d66e9d445ee87ab058b3e2e5c43b1d8.script [ctx] 10000]
