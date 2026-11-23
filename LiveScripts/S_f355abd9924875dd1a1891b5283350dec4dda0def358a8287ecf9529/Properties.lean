import LiveScripts.Shared
import LiveScripts.S_f355abd9924875dd1a1891b5283350dec4dda0def358a8287ecf9529.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f355abd9924875dd1a1891b5283350dec4dda0def358a8287ecf9529.script [ctx] 10000]
