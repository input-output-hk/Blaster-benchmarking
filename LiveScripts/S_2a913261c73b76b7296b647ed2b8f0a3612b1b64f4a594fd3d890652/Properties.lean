import LiveScripts.Shared
import LiveScripts.S_2a913261c73b76b7296b647ed2b8f0a3612b1b64f4a594fd3d890652.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2a913261c73b76b7296b647ed2b8f0a3612b1b64f4a594fd3d890652.script [redeemer, ctx] 10000]
