import CardanoLedgerApi.V1
import LiveScripts.S_d6b271fb510941534f9c5d4903e010639f20e5cbe35b1b10272cd2e1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d6b271fb510941534f9c5d4903e010639f20e5cbe35b1b10272cd2e1.script (spendingInputs input) 1000)]
