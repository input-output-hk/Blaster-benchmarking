import CardanoLedgerApi.V2
import LiveScripts.S_4ab17afc9a19a4f06b6fe229f9501e727d3968bff03acb1a8f86acf5.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4ab17afc9a19a4f06b6fe229f9501e727d3968bff03acb1a8f86acf5.script (spendingInputs input) 1000)]
