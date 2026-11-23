import LiveScripts.Shared
import LiveScripts.S_1206aaaf9d1d296cfc2642fe67e310112d7f83e366e1ed80c22a5438.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1206aaaf9d1d296cfc2642fe67e310112d7f83e366e1ed80c22a5438.script [redeemer, ctx] 10000]
