import CardanoLedgerApi.V1
import LiveScripts.S_b316f8f668aca7359ecc6073475c0c8106239bf87e05a3a1bd569764.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b316f8f668aca7359ecc6073475c0c8106239bf87e05a3a1bd569764.script (mintingInputs input) 1000)]
