import LiveScripts.Shared
import LiveScripts.S_7d2ddbadbe784afcf07442e5b2c35e9097da4be61162b5ee8848fe00.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7d2ddbadbe784afcf07442e5b2c35e9097da4be61162b5ee8848fe00.script [ctx] 10000]
