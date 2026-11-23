import LiveScripts.Shared
import LiveScripts.S_c1c751c30a31b5d456c87f7fa3caecabd3d2585e5463dd866eb25511.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c1c751c30a31b5d456c87f7fa3caecabd3d2585e5463dd866eb25511.script [datum, redeemer, ctx] 10000]
