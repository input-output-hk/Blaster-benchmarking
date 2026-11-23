import LiveScripts.Shared
import LiveScripts.S_614fad2aa3c7f8b1756e90c24519a87f7b01183fc0a399ea1a3004da.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_614fad2aa3c7f8b1756e90c24519a87f7b01183fc0a399ea1a3004da.script [redeemer, ctx] 10000]
