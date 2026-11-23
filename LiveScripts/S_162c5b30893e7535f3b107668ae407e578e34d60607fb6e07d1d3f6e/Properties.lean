import CardanoLedgerApi.V1
import LiveScripts.S_162c5b30893e7535f3b107668ae407e578e34d60607fb6e07d1d3f6e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_162c5b30893e7535f3b107668ae407e578e34d60607fb6e07d1d3f6e.script (mintingInputs input) 1000)]
