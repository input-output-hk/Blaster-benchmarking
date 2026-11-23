import LiveScripts.Shared
import LiveScripts.S_d6fb6d269d5cb069af9108812ae81b087e53c8b423028960ebd94164.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d6fb6d269d5cb069af9108812ae81b087e53c8b423028960ebd94164.script [ctx] 10000]
