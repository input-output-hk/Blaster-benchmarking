import CardanoLedgerApi.V1
import LiveScripts.S_86201ca242ee5fcf2a83d5b6d7f20512479022cc2035dd2082736fa9.Script
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
      ¬ isSuccessful (cekExecuteProgram script_86201ca242ee5fcf2a83d5b6d7f20512479022cc2035dd2082736fa9.script (mintingInputs input) 1000)]
