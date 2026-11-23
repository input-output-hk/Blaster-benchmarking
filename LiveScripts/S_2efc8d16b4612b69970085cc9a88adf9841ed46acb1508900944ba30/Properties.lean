import LiveScripts.Shared
import LiveScripts.S_2efc8d16b4612b69970085cc9a88adf9841ed46acb1508900944ba30.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2efc8d16b4612b69970085cc9a88adf9841ed46acb1508900944ba30.script [ctx] 10000]
