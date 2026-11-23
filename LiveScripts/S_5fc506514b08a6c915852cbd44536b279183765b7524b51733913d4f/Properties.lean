import LiveScripts.Shared
import LiveScripts.S_5fc506514b08a6c915852cbd44536b279183765b7524b51733913d4f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5fc506514b08a6c915852cbd44536b279183765b7524b51733913d4f.script [ctx] 10000]
