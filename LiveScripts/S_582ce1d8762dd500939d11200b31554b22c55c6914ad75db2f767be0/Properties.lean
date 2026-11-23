import LiveScripts.Shared
import LiveScripts.S_582ce1d8762dd500939d11200b31554b22c55c6914ad75db2f767be0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_582ce1d8762dd500939d11200b31554b22c55c6914ad75db2f767be0.script [ctx] 10000]
