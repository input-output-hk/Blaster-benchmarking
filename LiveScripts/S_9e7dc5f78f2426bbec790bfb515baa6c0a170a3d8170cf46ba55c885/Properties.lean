import LiveScripts.Shared
import LiveScripts.S_9e7dc5f78f2426bbec790bfb515baa6c0a170a3d8170cf46ba55c885.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9e7dc5f78f2426bbec790bfb515baa6c0a170a3d8170cf46ba55c885.script [ctx] 10000]
