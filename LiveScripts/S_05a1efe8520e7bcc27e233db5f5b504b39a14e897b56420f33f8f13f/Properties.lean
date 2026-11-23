import CardanoLedgerApi.V2
import LiveScripts.S_05a1efe8520e7bcc27e233db5f5b504b39a14e897b56420f33f8f13f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_05a1efe8520e7bcc27e233db5f5b504b39a14e897b56420f33f8f13f.script (spendingInputs input) 1000)]
