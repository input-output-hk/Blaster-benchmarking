import LiveScripts.Shared
import LiveScripts.S_1cf9e87a5325a3f10afe0083bc6161f9b42298cd781fbaeb5d92c698.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1cf9e87a5325a3f10afe0083bc6161f9b42298cd781fbaeb5d92c698.script [redeemer, ctx] 10000]
