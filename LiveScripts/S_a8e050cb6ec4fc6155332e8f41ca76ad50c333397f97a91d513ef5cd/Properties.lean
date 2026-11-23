import CardanoLedgerApi.V1
import LiveScripts.S_a8e050cb6ec4fc6155332e8f41ca76ad50c333397f97a91d513ef5cd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a8e050cb6ec4fc6155332e8f41ca76ad50c333397f97a91d513ef5cd.script (spendingInputs input) 1000)]
