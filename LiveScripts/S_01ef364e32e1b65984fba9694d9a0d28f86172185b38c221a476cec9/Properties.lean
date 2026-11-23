import LiveScripts.Shared
import LiveScripts.S_01ef364e32e1b65984fba9694d9a0d28f86172185b38c221a476cec9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_01ef364e32e1b65984fba9694d9a0d28f86172185b38c221a476cec9.script [ctx] 10000]
