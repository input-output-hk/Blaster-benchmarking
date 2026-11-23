import LiveScripts.Shared
import LiveScripts.S_25bbd5f000647e0ebd8bae4d75e1195a824df92187733036ff0803d0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_25bbd5f000647e0ebd8bae4d75e1195a824df92187733036ff0803d0.script [ctx] 10000]
