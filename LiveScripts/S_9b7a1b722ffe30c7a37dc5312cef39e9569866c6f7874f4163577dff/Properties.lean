import LiveScripts.Shared
import LiveScripts.S_9b7a1b722ffe30c7a37dc5312cef39e9569866c6f7874f4163577dff.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9b7a1b722ffe30c7a37dc5312cef39e9569866c6f7874f4163577dff.script [redeemer, ctx] 10000]
