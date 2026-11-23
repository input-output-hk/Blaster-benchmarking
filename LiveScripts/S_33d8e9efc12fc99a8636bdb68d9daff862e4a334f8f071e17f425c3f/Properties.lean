import CardanoLedgerApi.V2
import LiveScripts.S_33d8e9efc12fc99a8636bdb68d9daff862e4a334f8f071e17f425c3f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_33d8e9efc12fc99a8636bdb68d9daff862e4a334f8f071e17f425c3f.script (spendingInputs input) 1000)]
