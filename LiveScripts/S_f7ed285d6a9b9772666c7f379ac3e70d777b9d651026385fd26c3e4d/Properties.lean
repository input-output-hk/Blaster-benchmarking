import LiveScripts.Shared
import LiveScripts.S_f7ed285d6a9b9772666c7f379ac3e70d777b9d651026385fd26c3e4d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f7ed285d6a9b9772666c7f379ac3e70d777b9d651026385fd26c3e4d.script [ctx] 10000]
