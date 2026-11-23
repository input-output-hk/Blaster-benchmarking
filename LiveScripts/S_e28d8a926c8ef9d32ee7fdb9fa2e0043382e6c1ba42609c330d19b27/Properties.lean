import LiveScripts.Shared
import LiveScripts.S_e28d8a926c8ef9d32ee7fdb9fa2e0043382e6c1ba42609c330d19b27.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e28d8a926c8ef9d32ee7fdb9fa2e0043382e6c1ba42609c330d19b27.script [ctx] 10000]
