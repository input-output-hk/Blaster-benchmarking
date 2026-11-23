import LiveScripts.Shared
import LiveScripts.S_4f3643256ad3abd75bc8b9676c635549fd00c1e41d42bdb8f31fe601.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4f3643256ad3abd75bc8b9676c635549fd00c1e41d42bdb8f31fe601.script [ctx] 10000]
