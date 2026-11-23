import LiveScripts.Shared
import LiveScripts.S_ebde68ce82b8a7a15c4b58a4a31001f959988f1fb7aa40adae3f44d5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ebde68ce82b8a7a15c4b58a4a31001f959988f1fb7aa40adae3f44d5.script [ctx] 10000]
