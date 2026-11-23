import CardanoLedgerApi.V2
import LiveScripts.S_f002facfd69d51b63e7046c6d40349b0b17c8dd775ee415c66af3ccc.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f002facfd69d51b63e7046c6d40349b0b17c8dd775ee415c66af3ccc.script (spendingInputs input) 1000)]
