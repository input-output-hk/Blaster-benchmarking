import CardanoLedgerApi.V1
import LiveScripts.S_66d106748f591ce7fc34c38150c4a9215b7de3b29e1ac30398c1486c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_66d106748f591ce7fc34c38150c4a9215b7de3b29e1ac30398c1486c.script (spendingInputs input) 1000)]
