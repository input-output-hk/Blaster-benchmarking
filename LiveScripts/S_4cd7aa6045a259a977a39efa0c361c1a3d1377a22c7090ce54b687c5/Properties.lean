import LiveScripts.Shared
import LiveScripts.S_4cd7aa6045a259a977a39efa0c361c1a3d1377a22c7090ce54b687c5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4cd7aa6045a259a977a39efa0c361c1a3d1377a22c7090ce54b687c5.script [datum, redeemer, ctx] 10000]
