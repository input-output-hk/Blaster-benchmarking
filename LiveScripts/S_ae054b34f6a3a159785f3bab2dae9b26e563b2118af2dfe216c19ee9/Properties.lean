import CardanoLedgerApi.V1
import LiveScripts.S_ae054b34f6a3a159785f3bab2dae9b26e563b2118af2dfe216c19ee9.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V1
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: spend; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ input : SpendingInput,
    validSpendingContext input →
      ¬ isSuccessful (cekExecuteProgram script_ae054b34f6a3a159785f3bab2dae9b26e563b2118af2dfe216c19ee9.script (spendingInputs input) 1000)]
