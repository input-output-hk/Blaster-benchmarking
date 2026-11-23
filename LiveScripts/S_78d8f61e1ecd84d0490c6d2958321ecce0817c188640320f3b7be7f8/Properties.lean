import CardanoLedgerApi.V1
import LiveScripts.S_78d8f61e1ecd84d0490c6d2958321ecce0817c188640320f3b7be7f8.Script
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
      ¬ isSuccessful (cekExecuteProgram script_78d8f61e1ecd84d0490c6d2958321ecce0817c188640320f3b7be7f8.script (spendingInputs input) 1000)]
