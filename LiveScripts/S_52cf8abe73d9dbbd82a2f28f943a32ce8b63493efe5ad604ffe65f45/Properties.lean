import LiveScripts.Shared
import LiveScripts.S_52cf8abe73d9dbbd82a2f28f943a32ce8b63493efe5ad604ffe65f45.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_52cf8abe73d9dbbd82a2f28f943a32ce8b63493efe5ad604ffe65f45.script [ctx] 10000]
