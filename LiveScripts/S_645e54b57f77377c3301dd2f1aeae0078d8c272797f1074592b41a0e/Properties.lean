import LiveScripts.Shared
import LiveScripts.S_645e54b57f77377c3301dd2f1aeae0078d8c272797f1074592b41a0e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_645e54b57f77377c3301dd2f1aeae0078d8c272797f1074592b41a0e.script [ctx] 10000]
