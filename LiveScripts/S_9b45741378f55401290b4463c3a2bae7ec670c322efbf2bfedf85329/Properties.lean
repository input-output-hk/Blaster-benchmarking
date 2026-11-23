import LiveScripts.Shared
import LiveScripts.S_9b45741378f55401290b4463c3a2bae7ec670c322efbf2bfedf85329.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9b45741378f55401290b4463c3a2bae7ec670c322efbf2bfedf85329.script [ctx] 10000]
