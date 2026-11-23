import LiveScripts.Shared
import LiveScripts.S_41d03b6245bfde772ab5a5e19362db621e4280a3d73068958e5a1cce.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_41d03b6245bfde772ab5a5e19362db621e4280a3d73068958e5a1cce.script [ctx] 10000]
