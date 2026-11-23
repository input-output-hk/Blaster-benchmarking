import CardanoLedgerApi.V1
import LiveScripts.S_6586cc81fa8b5ccdef957a0218c5f08b9ba4011ad78bf9842fc2aa3c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6586cc81fa8b5ccdef957a0218c5f08b9ba4011ad78bf9842fc2aa3c.script (spendingInputs input) 1000)]
