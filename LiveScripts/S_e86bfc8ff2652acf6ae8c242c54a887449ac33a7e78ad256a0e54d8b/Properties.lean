import CardanoLedgerApi.V1
import LiveScripts.S_e86bfc8ff2652acf6ae8c242c54a887449ac33a7e78ad256a0e54d8b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e86bfc8ff2652acf6ae8c242c54a887449ac33a7e78ad256a0e54d8b.script (spendingInputs input) 1000)]
