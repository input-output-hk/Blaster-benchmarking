import LiveScripts.Shared
import LiveScripts.S_34293de1784ad1dec6f8c975e220c5dab93e636c8d877f99d89c42ce.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_34293de1784ad1dec6f8c975e220c5dab93e636c8d877f99d89c42ce.script [redeemer, ctx] 10000]
