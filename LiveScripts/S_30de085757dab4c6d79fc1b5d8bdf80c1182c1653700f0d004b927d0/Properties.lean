import LiveScripts.Shared
import LiveScripts.S_30de085757dab4c6d79fc1b5d8bdf80c1182c1653700f0d004b927d0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_30de085757dab4c6d79fc1b5d8bdf80c1182c1653700f0d004b927d0.script [ctx] 10000]
