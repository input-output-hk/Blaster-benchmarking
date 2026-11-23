import LiveScripts.Shared
import LiveScripts.S_756897fd5f7f838ae49b244efd813207ef525e6c5ab85c3e2fdc79a5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_756897fd5f7f838ae49b244efd813207ef525e6c5ab85c3e2fdc79a5.script [ctx] 10000]
