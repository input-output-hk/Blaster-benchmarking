import LiveScripts.Shared
import LiveScripts.S_4017803aa0f75a71f128eca7b87092d1e68066875d9123ea64cb3c8a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4017803aa0f75a71f128eca7b87092d1e68066875d9123ea64cb3c8a.script [ctx] 10000]
