import CardanoLedgerApi.V2
import LiveScripts.S_2618e94cdb06792f05ae9b1ec78b0231f4b7f4215b1b4cf52e6342de.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2618e94cdb06792f05ae9b1ec78b0231f4b7f4215b1b4cf52e6342de.script (spendingInputs input) 1000)]
