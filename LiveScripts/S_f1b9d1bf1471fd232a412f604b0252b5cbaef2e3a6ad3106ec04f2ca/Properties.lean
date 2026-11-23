import LiveScripts.Shared
import LiveScripts.S_f1b9d1bf1471fd232a412f604b0252b5cbaef2e3a6ad3106ec04f2ca.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f1b9d1bf1471fd232a412f604b0252b5cbaef2e3a6ad3106ec04f2ca.script [ctx] 10000]
