import LiveScripts.Shared
import LiveScripts.S_b819881101e06d5cfaf2ab0a097b1a6d7fa571107d48c3b6bbd83fcb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b819881101e06d5cfaf2ab0a097b1a6d7fa571107d48c3b6bbd83fcb.script [ctx] 10000]
