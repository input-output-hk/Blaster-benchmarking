import LiveScripts.Shared
import LiveScripts.S_02cc0a696dd3ccc99df7fdf6dce53f63477fa488c2edb2352520db52.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_02cc0a696dd3ccc99df7fdf6dce53f63477fa488c2edb2352520db52.script [ctx] 10000]
