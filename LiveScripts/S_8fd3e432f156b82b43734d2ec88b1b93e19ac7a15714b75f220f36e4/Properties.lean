import LiveScripts.Shared
import LiveScripts.S_8fd3e432f156b82b43734d2ec88b1b93e19ac7a15714b75f220f36e4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8fd3e432f156b82b43734d2ec88b1b93e19ac7a15714b75f220f36e4.script [datum, redeemer, ctx] 10000]
