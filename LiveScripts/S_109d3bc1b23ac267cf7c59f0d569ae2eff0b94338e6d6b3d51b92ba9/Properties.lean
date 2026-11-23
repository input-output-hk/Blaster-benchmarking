import CardanoLedgerApi.V2
import LiveScripts.S_109d3bc1b23ac267cf7c59f0d569ae2eff0b94338e6d6b3d51b92ba9.Script
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
      ¬ isSuccessful (cekExecuteProgram script_109d3bc1b23ac267cf7c59f0d569ae2eff0b94338e6d6b3d51b92ba9.script (mintingInputs input) 1000)]
