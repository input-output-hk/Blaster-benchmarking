import CardanoLedgerApi.V3
import LiveScripts.S_318f6be4d52810c61d11e89ccc2fb6bb99272aa3da9e86224e66ead3.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: spend; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validSpendingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_318f6be4d52810c61d11e89ccc2fb6bb99272aa3da9e86224e66ead3.script (spendingInputs ctx) 1000)]
