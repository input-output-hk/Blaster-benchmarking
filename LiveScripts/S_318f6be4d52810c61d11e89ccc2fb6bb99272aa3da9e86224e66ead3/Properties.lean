import LiveScripts.Shared
import LiveScripts.S_318f6be4d52810c61d11e89ccc2fb6bb99272aa3da9e86224e66ead3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_318f6be4d52810c61d11e89ccc2fb6bb99272aa3da9e86224e66ead3.script [ctx] 10000]
