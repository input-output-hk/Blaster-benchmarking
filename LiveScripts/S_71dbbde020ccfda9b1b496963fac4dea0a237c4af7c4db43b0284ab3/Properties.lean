import CardanoLedgerApi.V1
import LiveScripts.S_71dbbde020ccfda9b1b496963fac4dea0a237c4af7c4db43b0284ab3.Script
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
      ¬ isSuccessful (cekExecuteProgram script_71dbbde020ccfda9b1b496963fac4dea0a237c4af7c4db43b0284ab3.script (spendingInputs input) 1000)]
