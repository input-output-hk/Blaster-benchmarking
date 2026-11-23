import LiveScripts.Shared
import LiveScripts.S_977bde54117ae6ce2a40551f6aeb935bc4b7372a09c76ad6979e88f6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_977bde54117ae6ce2a40551f6aeb935bc4b7372a09c76ad6979e88f6.script [ctx] 10000]
