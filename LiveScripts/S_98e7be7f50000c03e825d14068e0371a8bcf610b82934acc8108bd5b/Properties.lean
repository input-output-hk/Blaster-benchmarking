import LiveScripts.Shared
import LiveScripts.S_98e7be7f50000c03e825d14068e0371a8bcf610b82934acc8108bd5b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_98e7be7f50000c03e825d14068e0371a8bcf610b82934acc8108bd5b.script [ctx] 10000]
