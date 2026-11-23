import CardanoLedgerApi.V1
import LiveScripts.S_c5e0385012d5f010b1dc7ab42ba632944052de232051ec6ce3bfd72e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c5e0385012d5f010b1dc7ab42ba632944052de232051ec6ce3bfd72e.script (spendingInputs input) 1000)]
