import CardanoLedgerApi.V2
import LiveScripts.S_96cfb318134576b3bad86f688bf40ecb60148ee5dd6a942932f60a8f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_96cfb318134576b3bad86f688bf40ecb60148ee5dd6a942932f60a8f.script (spendingInputs input) 1000)]
