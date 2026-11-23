import LiveScripts.Shared
import LiveScripts.S_81eca49bf2846e9097a7d20ee313334ffbe2a70cafe4a3126730f31f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_81eca49bf2846e9097a7d20ee313334ffbe2a70cafe4a3126730f31f.script [ctx] 10000]
