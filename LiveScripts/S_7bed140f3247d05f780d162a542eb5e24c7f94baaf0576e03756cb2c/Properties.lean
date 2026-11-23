import CardanoLedgerApi.V1
import LiveScripts.S_7bed140f3247d05f780d162a542eb5e24c7f94baaf0576e03756cb2c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7bed140f3247d05f780d162a542eb5e24c7f94baaf0576e03756cb2c.script (spendingInputs input) 1000)]
