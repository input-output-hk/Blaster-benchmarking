import LiveScripts.Shared
import LiveScripts.S_538f28305f853d1417da466e8faacea7bc70dbd22105844e3d22ed2d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_538f28305f853d1417da466e8faacea7bc70dbd22105844e3d22ed2d.script [ctx] 10000]
