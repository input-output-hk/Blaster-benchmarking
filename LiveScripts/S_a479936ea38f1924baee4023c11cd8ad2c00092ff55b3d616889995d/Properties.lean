import LiveScripts.Shared
import LiveScripts.S_a479936ea38f1924baee4023c11cd8ad2c00092ff55b3d616889995d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a479936ea38f1924baee4023c11cd8ad2c00092ff55b3d616889995d.script [ctx] 10000]
