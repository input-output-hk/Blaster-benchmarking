import LiveScripts.Shared
import LiveScripts.S_3f4e8a676b185164db5ea426c296e569b4366be75653ed4a8f7aba6c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3f4e8a676b185164db5ea426c296e569b4366be75653ed4a8f7aba6c.script [ctx] 10000]
