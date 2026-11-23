import LiveScripts.Shared
import LiveScripts.S_78f60f2795f54529ff3fde0c390103e8abc1b134d91e9da3eec07e2d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_78f60f2795f54529ff3fde0c390103e8abc1b134d91e9da3eec07e2d.script [ctx] 10000]
