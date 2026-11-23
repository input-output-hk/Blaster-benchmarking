import LiveScripts.Shared
import LiveScripts.S_22198e92c371325a4d81f6e52b29a0a906f18be19037cac31f428aca.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_22198e92c371325a4d81f6e52b29a0a906f18be19037cac31f428aca.script [ctx] 10000]
