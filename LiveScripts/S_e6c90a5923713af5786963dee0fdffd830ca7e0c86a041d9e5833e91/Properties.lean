import CardanoLedgerApi.V1
import LiveScripts.S_e6c90a5923713af5786963dee0fdffd830ca7e0c86a041d9e5833e91.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e6c90a5923713af5786963dee0fdffd830ca7e0c86a041d9e5833e91.script (spendingInputs input) 1000)]
