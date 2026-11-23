import CardanoLedgerApi.V2
import LiveScripts.S_6bb0851fa2bf40c6729c9d5df97a4201fdea2b3ae169ad5242bfe47a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6bb0851fa2bf40c6729c9d5df97a4201fdea2b3ae169ad5242bfe47a.script (spendingInputs input) 1000)]
