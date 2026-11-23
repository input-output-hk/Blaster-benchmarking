import LiveScripts.Shared
import LiveScripts.S_498de66616ea3e40ec69d6ff7c415d7c0d00633f34639bc6a3f1d9a3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_498de66616ea3e40ec69d6ff7c415d7c0d00633f34639bc6a3f1d9a3.script [datum, redeemer, ctx] 10000]
