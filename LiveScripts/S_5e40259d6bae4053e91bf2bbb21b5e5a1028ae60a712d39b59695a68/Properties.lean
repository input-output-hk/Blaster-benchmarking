import LiveScripts.Shared
import LiveScripts.S_5e40259d6bae4053e91bf2bbb21b5e5a1028ae60a712d39b59695a68.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5e40259d6bae4053e91bf2bbb21b5e5a1028ae60a712d39b59695a68.script [ctx] 10000]
