import LiveScripts.Shared
import LiveScripts.S_30f1fac08a15ef84ea6a5aa04989b1c2ceeb3b437f2c3103df5aca68.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_30f1fac08a15ef84ea6a5aa04989b1c2ceeb3b437f2c3103df5aca68.script [ctx] 10000]
