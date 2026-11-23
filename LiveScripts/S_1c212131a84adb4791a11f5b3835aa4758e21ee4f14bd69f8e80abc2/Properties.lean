import CardanoLedgerApi.V2
import LiveScripts.S_1c212131a84adb4791a11f5b3835aa4758e21ee4f14bd69f8e80abc2.Script
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
      ¬ isSuccessful (cekExecuteProgram script_1c212131a84adb4791a11f5b3835aa4758e21ee4f14bd69f8e80abc2.script (mintingInputs input) 1000)]
