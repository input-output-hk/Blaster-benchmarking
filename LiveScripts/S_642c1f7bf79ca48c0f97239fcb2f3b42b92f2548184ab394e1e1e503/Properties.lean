import CardanoLedgerApi.V2
import LiveScripts.S_642c1f7bf79ca48c0f97239fcb2f3b42b92f2548184ab394e1e1e503.Script
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
      ¬ isSuccessful (cekExecuteProgram script_642c1f7bf79ca48c0f97239fcb2f3b42b92f2548184ab394e1e1e503.script (mintingInputs input) 1000)]
