import LiveScripts.Shared
import LiveScripts.S_d209e7f4f214066c4fcecbd96a4c9cac67498e8dddb3662dcd68dc3b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d209e7f4f214066c4fcecbd96a4c9cac67498e8dddb3662dcd68dc3b.script [ctx] 10000]
