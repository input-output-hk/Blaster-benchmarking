import LiveScripts.Shared
import LiveScripts.S_d1bd4c02a6c80e68050739d7f1a562600a0a8ddca24c86731d4594bb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d1bd4c02a6c80e68050739d7f1a562600a0a8ddca24c86731d4594bb.script [ctx] 10000]
