import CardanoLedgerApi.V2
import LiveScripts.S_fc7766e8d1fbd521c9fecc6b1cc7d2d08ece2cb1968160659d9f9b42.Script
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
      ¬ isSuccessful (cekExecuteProgram script_fc7766e8d1fbd521c9fecc6b1cc7d2d08ece2cb1968160659d9f9b42.script (mintingInputs input) 1000)]
