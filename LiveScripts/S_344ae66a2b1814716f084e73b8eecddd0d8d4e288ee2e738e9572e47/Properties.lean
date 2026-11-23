import LiveScripts.Shared
import LiveScripts.S_344ae66a2b1814716f084e73b8eecddd0d8d4e288ee2e738e9572e47.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_344ae66a2b1814716f084e73b8eecddd0d8d4e288ee2e738e9572e47.script [ctx] 10000]
