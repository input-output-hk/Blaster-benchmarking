import LiveScripts.Shared
import LiveScripts.S_c922b4999af87eb351bffe2d57f8d7ef5d21ee6da0ad492e06913b8a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c922b4999af87eb351bffe2d57f8d7ef5d21ee6da0ad492e06913b8a.script [ctx] 10000]
