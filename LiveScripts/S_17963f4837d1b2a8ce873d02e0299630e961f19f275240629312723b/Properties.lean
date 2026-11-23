import LiveScripts.Shared
import LiveScripts.S_17963f4837d1b2a8ce873d02e0299630e961f19f275240629312723b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_17963f4837d1b2a8ce873d02e0299630e961f19f275240629312723b.script [ctx] 10000]
