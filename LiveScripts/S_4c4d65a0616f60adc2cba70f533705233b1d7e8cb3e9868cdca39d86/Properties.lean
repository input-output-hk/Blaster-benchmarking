import CardanoLedgerApi.V2
import LiveScripts.S_4c4d65a0616f60adc2cba70f533705233b1d7e8cb3e9868cdca39d86.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V2
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: spend; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ input : SpendingInput,
    validSpendingContext input →
      ¬ isSuccessful (cekExecuteProgram script_4c4d65a0616f60adc2cba70f533705233b1d7e8cb3e9868cdca39d86.script (spendingInputs input) 1000)]
