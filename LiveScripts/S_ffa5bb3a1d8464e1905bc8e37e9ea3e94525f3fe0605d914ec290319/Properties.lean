import CardanoLedgerApi.V1
import LiveScripts.S_ffa5bb3a1d8464e1905bc8e37e9ea3e94525f3fe0605d914ec290319.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ffa5bb3a1d8464e1905bc8e37e9ea3e94525f3fe0605d914ec290319.script (spendingInputs input) 1000)]
