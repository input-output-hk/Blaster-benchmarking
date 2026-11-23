import LiveScripts.Shared
import LiveScripts.S_8be29cdc96e8d4d708b0daeb4ac670d4847234d6a399a748db424b0a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8be29cdc96e8d4d708b0daeb4ac670d4847234d6a399a748db424b0a.script [ctx] 10000]
