import CardanoLedgerApi.V1
import LiveScripts.S_daa2ec2088168b4507ba1b5de63ff202b60c6b0bb8aef5450a34d263.Script
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
      ¬ isSuccessful (cekExecuteProgram script_daa2ec2088168b4507ba1b5de63ff202b60c6b0bb8aef5450a34d263.script (mintingInputs input) 1000)]
