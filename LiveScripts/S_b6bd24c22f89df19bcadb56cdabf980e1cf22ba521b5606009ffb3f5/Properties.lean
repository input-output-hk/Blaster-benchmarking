import LiveScripts.Shared
import LiveScripts.S_b6bd24c22f89df19bcadb56cdabf980e1cf22ba521b5606009ffb3f5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b6bd24c22f89df19bcadb56cdabf980e1cf22ba521b5606009ffb3f5.script [ctx] 10000]
