import CardanoLedgerApi.V2
import LiveScripts.S_278825f2fbb67f3b2418fc239315f8911e4ddf1ddbb14f1f7c9e0393.Script
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
      ¬ isSuccessful (cekExecuteProgram script_278825f2fbb67f3b2418fc239315f8911e4ddf1ddbb14f1f7c9e0393.script (spendingInputs input) 1000)]
