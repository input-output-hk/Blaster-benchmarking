import CardanoLedgerApi.V2
import LiveScripts.S_e3c25342f3ae4ed3208cde5c333cd3ca8b48bf91cee8cecff4d8c363.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e3c25342f3ae4ed3208cde5c333cd3ca8b48bf91cee8cecff4d8c363.script (spendingInputs input) 1000)]
