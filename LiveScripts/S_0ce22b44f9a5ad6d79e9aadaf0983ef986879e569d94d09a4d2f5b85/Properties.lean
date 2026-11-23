import LiveScripts.Shared
import LiveScripts.S_0ce22b44f9a5ad6d79e9aadaf0983ef986879e569d94d09a4d2f5b85.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0ce22b44f9a5ad6d79e9aadaf0983ef986879e569d94d09a4d2f5b85.script [ctx] 10000]
