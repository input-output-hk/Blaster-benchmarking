import LiveScripts.Shared
import LiveScripts.S_ca6a9add9948759e88f630d7593db838df9103e50a15aafbf50c4f3f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ca6a9add9948759e88f630d7593db838df9103e50a15aafbf50c4f3f.script [datum, redeemer, ctx] 10000]
