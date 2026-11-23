import LiveScripts.Shared
import LiveScripts.S_e8d6adfcd9a5d9a44bea6feb8b83712c7056906d247c5ed5ae7040ea.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e8d6adfcd9a5d9a44bea6feb8b83712c7056906d247c5ed5ae7040ea.script [ctx] 10000]
