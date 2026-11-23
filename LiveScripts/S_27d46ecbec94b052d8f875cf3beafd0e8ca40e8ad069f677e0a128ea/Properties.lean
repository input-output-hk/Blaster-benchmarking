import CardanoLedgerApi.V2
import LiveScripts.S_27d46ecbec94b052d8f875cf3beafd0e8ca40e8ad069f677e0a128ea.Script
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
      ¬ isSuccessful (cekExecuteProgram script_27d46ecbec94b052d8f875cf3beafd0e8ca40e8ad069f677e0a128ea.script (spendingInputs input) 1000)]
