import LiveScripts.Shared
import LiveScripts.S_6703ac5e7d304601c326b5ddd9554d08ff05b0b9929f1905504f1955.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6703ac5e7d304601c326b5ddd9554d08ff05b0b9929f1905504f1955.script [ctx] 10000]
