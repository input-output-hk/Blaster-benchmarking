import LiveScripts.Shared
import LiveScripts.S_7cc5b5e85b03b9dc18ee93162a13a911a5bedad39053506d669465e8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7cc5b5e85b03b9dc18ee93162a13a911a5bedad39053506d669465e8.script [redeemer, ctx] 10000]
