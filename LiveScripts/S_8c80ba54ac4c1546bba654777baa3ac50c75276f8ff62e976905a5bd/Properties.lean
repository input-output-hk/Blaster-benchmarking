import LiveScripts.Shared
import LiveScripts.S_8c80ba54ac4c1546bba654777baa3ac50c75276f8ff62e976905a5bd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8c80ba54ac4c1546bba654777baa3ac50c75276f8ff62e976905a5bd.script [ctx] 10000]
