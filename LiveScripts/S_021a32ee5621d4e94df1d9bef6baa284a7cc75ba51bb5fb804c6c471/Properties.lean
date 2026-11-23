import CardanoLedgerApi.V2
import LiveScripts.S_021a32ee5621d4e94df1d9bef6baa284a7cc75ba51bb5fb804c6c471.Script
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
      ¬ isSuccessful (cekExecuteProgram script_021a32ee5621d4e94df1d9bef6baa284a7cc75ba51bb5fb804c6c471.script (spendingInputs input) 1000)]
