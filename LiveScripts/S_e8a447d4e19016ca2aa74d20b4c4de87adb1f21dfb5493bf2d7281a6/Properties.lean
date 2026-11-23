import CardanoLedgerApi.V1
import LiveScripts.S_e8a447d4e19016ca2aa74d20b4c4de87adb1f21dfb5493bf2d7281a6.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V1
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: mint; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ input : MintingInput,
    validMintingContext input →
      ¬ isSuccessful (cekExecuteProgram script_e8a447d4e19016ca2aa74d20b4c4de87adb1f21dfb5493bf2d7281a6.script (mintingInputs input) 1000)]
