import CardanoLedgerApi.V2
import LiveScripts.S_7bc5fbd41a95f561be84369631e0e35895efb0b73e0a7480bb9ed730.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7bc5fbd41a95f561be84369631e0e35895efb0b73e0a7480bb9ed730.script (spendingInputs input) 1000)]
