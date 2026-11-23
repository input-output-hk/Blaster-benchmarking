import LiveScripts.Shared
import LiveScripts.S_cdd31e84650c9d31a0751c595b3e7aa5e8ccd14c6f34d1efda8c83fa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cdd31e84650c9d31a0751c595b3e7aa5e8ccd14c6f34d1efda8c83fa.script [datum, redeemer, ctx] 10000]
