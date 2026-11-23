import LiveScripts.Shared
import LiveScripts.S_483d7f49036eaa3ed5a82a1f5a729a2cf5a2432df70549ebe3b1b871.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_483d7f49036eaa3ed5a82a1f5a729a2cf5a2432df70549ebe3b1b871.script [redeemer, ctx] 10000]
