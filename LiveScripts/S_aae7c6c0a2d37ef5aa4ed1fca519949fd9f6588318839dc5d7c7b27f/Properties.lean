import CardanoLedgerApi.V2
import LiveScripts.S_aae7c6c0a2d37ef5aa4ed1fca519949fd9f6588318839dc5d7c7b27f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_aae7c6c0a2d37ef5aa4ed1fca519949fd9f6588318839dc5d7c7b27f.script (spendingInputs input) 1000)]
