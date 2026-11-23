import LiveScripts.Shared
import LiveScripts.S_eb75c165e2eb344a6e33c7dd0ec777b7419047374d50d08f47349d68.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_eb75c165e2eb344a6e33c7dd0ec777b7419047374d50d08f47349d68.script [ctx] 10000]
