import CardanoLedgerApi.V1
import LiveScripts.S_6ed6c370b29fdfcf59d27465209608b9674a51de9db9f69a12121f1f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6ed6c370b29fdfcf59d27465209608b9674a51de9db9f69a12121f1f.script (spendingInputs input) 1000)]
