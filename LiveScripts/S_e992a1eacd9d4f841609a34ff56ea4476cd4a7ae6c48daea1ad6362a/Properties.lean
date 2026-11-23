import CardanoLedgerApi.V2
import LiveScripts.S_e992a1eacd9d4f841609a34ff56ea4476cd4a7ae6c48daea1ad6362a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e992a1eacd9d4f841609a34ff56ea4476cd4a7ae6c48daea1ad6362a.script (mintingInputs input) 1000)]
