import CardanoLedgerApi.V2
import LiveScripts.S_b4f7a70f758c05cdbf5498917ecdaee1fadef4cdff140a8435df81eb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b4f7a70f758c05cdbf5498917ecdaee1fadef4cdff140a8435df81eb.script (spendingInputs input) 1000)]
