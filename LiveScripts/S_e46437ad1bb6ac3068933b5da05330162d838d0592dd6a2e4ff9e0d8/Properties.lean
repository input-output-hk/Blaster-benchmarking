import LiveScripts.Shared
import LiveScripts.S_e46437ad1bb6ac3068933b5da05330162d838d0592dd6a2e4ff9e0d8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e46437ad1bb6ac3068933b5da05330162d838d0592dd6a2e4ff9e0d8.script [ctx] 10000]
