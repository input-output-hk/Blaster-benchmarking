import LiveScripts.Shared
import LiveScripts.S_6f848bb03f413422efc0824568f20a4322d72fea065e267a25daec77.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6f848bb03f413422efc0824568f20a4322d72fea065e267a25daec77.script [ctx] 10000]
