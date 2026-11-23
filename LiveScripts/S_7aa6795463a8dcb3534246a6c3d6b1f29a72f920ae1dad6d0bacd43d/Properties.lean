import LiveScripts.Shared
import LiveScripts.S_7aa6795463a8dcb3534246a6c3d6b1f29a72f920ae1dad6d0bacd43d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7aa6795463a8dcb3534246a6c3d6b1f29a72f920ae1dad6d0bacd43d.script [ctx] 10000]
