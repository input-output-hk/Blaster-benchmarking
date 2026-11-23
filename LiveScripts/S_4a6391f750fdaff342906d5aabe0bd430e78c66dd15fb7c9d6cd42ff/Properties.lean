import LiveScripts.Shared
import LiveScripts.S_4a6391f750fdaff342906d5aabe0bd430e78c66dd15fb7c9d6cd42ff.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4a6391f750fdaff342906d5aabe0bd430e78c66dd15fb7c9d6cd42ff.script [ctx] 10000]
