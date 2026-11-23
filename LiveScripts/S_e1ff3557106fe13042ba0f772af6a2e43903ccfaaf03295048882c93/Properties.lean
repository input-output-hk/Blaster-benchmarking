import LiveScripts.Shared
import LiveScripts.S_e1ff3557106fe13042ba0f772af6a2e43903ccfaaf03295048882c93.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e1ff3557106fe13042ba0f772af6a2e43903ccfaaf03295048882c93.script [redeemer, ctx] 10000]
