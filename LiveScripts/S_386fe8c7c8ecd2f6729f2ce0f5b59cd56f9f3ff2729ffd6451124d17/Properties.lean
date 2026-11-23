import LiveScripts.Shared
import LiveScripts.S_386fe8c7c8ecd2f6729f2ce0f5b59cd56f9f3ff2729ffd6451124d17.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_386fe8c7c8ecd2f6729f2ce0f5b59cd56f9f3ff2729ffd6451124d17.script [ctx] 10000]
