import CardanoLedgerApi.V2
import LiveScripts.S_2b48af6fd01c49d05ddee3badaba999c4cf8c41ca69c71928a3a6986.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2b48af6fd01c49d05ddee3badaba999c4cf8c41ca69c71928a3a6986.script (spendingInputs input) 1000)]
