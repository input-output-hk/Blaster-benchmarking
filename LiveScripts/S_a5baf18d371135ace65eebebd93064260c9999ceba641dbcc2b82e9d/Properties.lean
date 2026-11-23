import LiveScripts.Shared
import LiveScripts.S_a5baf18d371135ace65eebebd93064260c9999ceba641dbcc2b82e9d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a5baf18d371135ace65eebebd93064260c9999ceba641dbcc2b82e9d.script [ctx] 10000]
