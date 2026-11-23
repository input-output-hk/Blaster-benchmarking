import LiveScripts.Shared
import LiveScripts.S_629b4510f29259fa6bc8232a019c59dd7ccd4b2185bb126644bfa5b7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_629b4510f29259fa6bc8232a019c59dd7ccd4b2185bb126644bfa5b7.script [redeemer, ctx] 10000]
