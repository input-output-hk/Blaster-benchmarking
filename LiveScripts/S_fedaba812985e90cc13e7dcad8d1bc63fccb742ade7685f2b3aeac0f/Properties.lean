import LiveScripts.Shared
import LiveScripts.S_fedaba812985e90cc13e7dcad8d1bc63fccb742ade7685f2b3aeac0f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fedaba812985e90cc13e7dcad8d1bc63fccb742ade7685f2b3aeac0f.script [ctx] 10000]
