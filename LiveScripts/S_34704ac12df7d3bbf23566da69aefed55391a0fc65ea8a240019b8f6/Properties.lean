import LiveScripts.Shared
import LiveScripts.S_34704ac12df7d3bbf23566da69aefed55391a0fc65ea8a240019b8f6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_34704ac12df7d3bbf23566da69aefed55391a0fc65ea8a240019b8f6.script [ctx] 10000]
