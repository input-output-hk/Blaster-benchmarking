import LiveScripts.Shared
import LiveScripts.S_b14eef859117f48699d281d60e583f00881ba23a79ae6774c9ac1237.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b14eef859117f48699d281d60e583f00881ba23a79ae6774c9ac1237.script [redeemer, ctx] 10000]
