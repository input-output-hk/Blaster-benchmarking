import LiveScripts.Shared
import LiveScripts.S_7bf1b4c29c3b695b032ddbebd15f95f9f204533806074b732b012a32.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7bf1b4c29c3b695b032ddbebd15f95f9f204533806074b732b012a32.script [ctx] 10000]
