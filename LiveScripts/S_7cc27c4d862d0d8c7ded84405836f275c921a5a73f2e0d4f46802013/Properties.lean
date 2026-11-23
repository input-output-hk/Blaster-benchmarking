import LiveScripts.Shared
import LiveScripts.S_7cc27c4d862d0d8c7ded84405836f275c921a5a73f2e0d4f46802013.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7cc27c4d862d0d8c7ded84405836f275c921a5a73f2e0d4f46802013.script [redeemer, ctx] 10000]
