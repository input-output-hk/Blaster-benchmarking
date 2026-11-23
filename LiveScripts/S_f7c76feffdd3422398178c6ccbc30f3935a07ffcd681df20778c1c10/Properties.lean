import CardanoLedgerApi.V1
import LiveScripts.S_f7c76feffdd3422398178c6ccbc30f3935a07ffcd681df20778c1c10.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f7c76feffdd3422398178c6ccbc30f3935a07ffcd681df20778c1c10.script (spendingInputs input) 1000)]
