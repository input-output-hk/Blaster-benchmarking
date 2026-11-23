import LiveScripts.Shared
import LiveScripts.S_9dedebc23d81b996764f117f61766561ae0ba128cd7c2f404de7c646.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9dedebc23d81b996764f117f61766561ae0ba128cd7c2f404de7c646.script [ctx] 10000]
