import CardanoLedgerApi.V1
import LiveScripts.S_29db5a6873e69bf3b7cee62d46004a2744ff1adb2188f4c86baa81e2.Script
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
      ¬ isSuccessful (cekExecuteProgram script_29db5a6873e69bf3b7cee62d46004a2744ff1adb2188f4c86baa81e2.script (spendingInputs input) 1000)]
