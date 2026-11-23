import LiveScripts.Shared
import LiveScripts.S_ac49e0969d76ed5aa9e9861a77be65f4fc29e9a979dc4c37a99eb8f4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ac49e0969d76ed5aa9e9861a77be65f4fc29e9a979dc4c37a99eb8f4.script [redeemer, ctx] 10000]
