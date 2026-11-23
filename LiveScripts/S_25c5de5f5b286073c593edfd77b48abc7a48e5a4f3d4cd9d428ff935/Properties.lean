import CardanoLedgerApi.V2
import LiveScripts.S_25c5de5f5b286073c593edfd77b48abc7a48e5a4f3d4cd9d428ff935.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V2
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: mint; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ input : MintingInput,
    validMintingContext input →
      ¬ isSuccessful (cekExecuteProgram script_25c5de5f5b286073c593edfd77b48abc7a48e5a4f3d4cd9d428ff935.script (mintingInputs input) 1000)]
