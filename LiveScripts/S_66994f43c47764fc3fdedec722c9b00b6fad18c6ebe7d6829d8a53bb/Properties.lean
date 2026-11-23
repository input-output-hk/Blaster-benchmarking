import CardanoLedgerApi.V2
import LiveScripts.S_66994f43c47764fc3fdedec722c9b00b6fad18c6ebe7d6829d8a53bb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_66994f43c47764fc3fdedec722c9b00b6fad18c6ebe7d6829d8a53bb.script (spendingInputs input) 1000)]
