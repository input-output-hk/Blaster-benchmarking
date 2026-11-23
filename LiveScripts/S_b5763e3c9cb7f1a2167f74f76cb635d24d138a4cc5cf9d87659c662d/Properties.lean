import LiveScripts.Shared
import LiveScripts.S_b5763e3c9cb7f1a2167f74f76cb635d24d138a4cc5cf9d87659c662d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b5763e3c9cb7f1a2167f74f76cb635d24d138a4cc5cf9d87659c662d.script [ctx] 10000]
