import LiveScripts.Shared
import LiveScripts.S_0ad94fc457e0293499f359f8dc74bc780ebbdb7671d062447eb15756.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0ad94fc457e0293499f359f8dc74bc780ebbdb7671d062447eb15756.script [ctx] 10000]
