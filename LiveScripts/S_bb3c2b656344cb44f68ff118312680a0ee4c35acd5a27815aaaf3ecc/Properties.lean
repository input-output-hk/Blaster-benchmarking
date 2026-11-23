import LiveScripts.Shared
import LiveScripts.S_bb3c2b656344cb44f68ff118312680a0ee4c35acd5a27815aaaf3ecc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bb3c2b656344cb44f68ff118312680a0ee4c35acd5a27815aaaf3ecc.script [ctx] 10000]
