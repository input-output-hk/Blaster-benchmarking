import LiveScripts.Shared
import LiveScripts.S_d8d465bc3f0c70fa41fde1e6b49f2d36f22dd56366997b39ffc728d7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d8d465bc3f0c70fa41fde1e6b49f2d36f22dd56366997b39ffc728d7.script [datum, redeemer, ctx] 10000]
