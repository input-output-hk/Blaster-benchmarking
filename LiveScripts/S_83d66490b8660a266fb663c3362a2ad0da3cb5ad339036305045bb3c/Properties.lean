import LiveScripts.Shared
import LiveScripts.S_83d66490b8660a266fb663c3362a2ad0da3cb5ad339036305045bb3c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_83d66490b8660a266fb663c3362a2ad0da3cb5ad339036305045bb3c.script [ctx] 10000]
