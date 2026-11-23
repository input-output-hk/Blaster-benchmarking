import LiveScripts.Shared
import LiveScripts.S_9268225030425f1ab4f8a9eebb394aa23f957e2ebf48a431a4686b18.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9268225030425f1ab4f8a9eebb394aa23f957e2ebf48a431a4686b18.script [ctx] 10000]
