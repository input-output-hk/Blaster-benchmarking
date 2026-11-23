import CardanoLedgerApi.V2
import LiveScripts.S_e3f874cedb63656c7beadb26ee485a55aa2954f2c9b84fce2cdb9dd8.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e3f874cedb63656c7beadb26ee485a55aa2954f2c9b84fce2cdb9dd8.script (spendingInputs input) 1000)]
