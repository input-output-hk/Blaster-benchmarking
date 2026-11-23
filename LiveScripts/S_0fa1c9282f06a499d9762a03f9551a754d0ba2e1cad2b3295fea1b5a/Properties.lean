import LiveScripts.Shared
import LiveScripts.S_0fa1c9282f06a499d9762a03f9551a754d0ba2e1cad2b3295fea1b5a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0fa1c9282f06a499d9762a03f9551a754d0ba2e1cad2b3295fea1b5a.script [datum, redeemer, ctx] 10000]
