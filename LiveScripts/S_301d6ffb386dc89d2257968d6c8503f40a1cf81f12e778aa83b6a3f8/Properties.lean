import CardanoLedgerApi.V2
import LiveScripts.S_301d6ffb386dc89d2257968d6c8503f40a1cf81f12e778aa83b6a3f8.Script
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
      ¬ isSuccessful (cekExecuteProgram script_301d6ffb386dc89d2257968d6c8503f40a1cf81f12e778aa83b6a3f8.script (spendingInputs input) 1000)]
