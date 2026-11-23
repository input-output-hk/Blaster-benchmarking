import LiveScripts.Shared
import LiveScripts.S_5688988aa30d7cc2a5172e0ffde42962077486de550f4a0e457ad774.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5688988aa30d7cc2a5172e0ffde42962077486de550f4a0e457ad774.script [ctx] 10000]
