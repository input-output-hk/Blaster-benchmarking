import LiveScripts.Shared
import LiveScripts.S_9afbf74bb9263b2434f6ced6657194464a3d2c93642fc26a1a8817a4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9afbf74bb9263b2434f6ced6657194464a3d2c93642fc26a1a8817a4.script [redeemer, ctx] 10000]
