import CardanoLedgerApi.V2
import LiveScripts.S_bc5a4d0fd042d6e631830de95d7451f63bfcd1420bfbbfce8cb08e1a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_bc5a4d0fd042d6e631830de95d7451f63bfcd1420bfbbfce8cb08e1a.script (spendingInputs input) 1000)]
