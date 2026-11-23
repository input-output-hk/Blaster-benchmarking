import CardanoLedgerApi.V2
import LiveScripts.S_e4942d551fab7c859636c2519d0c7247c2f346892a0b3d01a4ab2bdb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e4942d551fab7c859636c2519d0c7247c2f346892a0b3d01a4ab2bdb.script (spendingInputs input) 1000)]
