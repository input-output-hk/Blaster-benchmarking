import CardanoLedgerApi.V2
import LiveScripts.S_a814a15d7fea8c1f3f265def27018933e599e2841d9ee3512b3ac92f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a814a15d7fea8c1f3f265def27018933e599e2841d9ee3512b3ac92f.script (mintingInputs input) 1000)]
