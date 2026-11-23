import LiveScripts.Shared
import LiveScripts.S_f16372c4e3c5fc33fd9ae245dc474876514fbc30e3dbb9df42fcde03.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f16372c4e3c5fc33fd9ae245dc474876514fbc30e3dbb9df42fcde03.script [ctx] 10000]
