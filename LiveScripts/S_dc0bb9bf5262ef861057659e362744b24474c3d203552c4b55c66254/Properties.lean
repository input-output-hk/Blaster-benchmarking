import LiveScripts.Shared
import LiveScripts.S_dc0bb9bf5262ef861057659e362744b24474c3d203552c4b55c66254.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dc0bb9bf5262ef861057659e362744b24474c3d203552c4b55c66254.script [ctx] 10000]
