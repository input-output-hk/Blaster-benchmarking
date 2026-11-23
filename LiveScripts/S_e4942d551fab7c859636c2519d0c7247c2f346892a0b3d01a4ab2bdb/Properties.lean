import LiveScripts.Shared
import LiveScripts.S_e4942d551fab7c859636c2519d0c7247c2f346892a0b3d01a4ab2bdb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e4942d551fab7c859636c2519d0c7247c2f346892a0b3d01a4ab2bdb.script [datum, redeemer, ctx] 10000]
