import CardanoLedgerApi.V2
import LiveScripts.S_58d33b5203a1a5a4157cab5503ae579f5277dacf7fa07dccb428cc59.Script
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
      ¬ isSuccessful (cekExecuteProgram script_58d33b5203a1a5a4157cab5503ae579f5277dacf7fa07dccb428cc59.script (spendingInputs input) 1000)]
