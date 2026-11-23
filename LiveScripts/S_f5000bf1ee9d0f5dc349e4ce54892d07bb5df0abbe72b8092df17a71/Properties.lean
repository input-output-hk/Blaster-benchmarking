import LiveScripts.Shared
import LiveScripts.S_f5000bf1ee9d0f5dc349e4ce54892d07bb5df0abbe72b8092df17a71.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f5000bf1ee9d0f5dc349e4ce54892d07bb5df0abbe72b8092df17a71.script [ctx] 10000]
