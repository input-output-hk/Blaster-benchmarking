import CardanoLedgerApi.V2
import LiveScripts.S_ada59c0aedbbf4bce5b899c6faad2682464ddc943c7ec3b70180899e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ada59c0aedbbf4bce5b899c6faad2682464ddc943c7ec3b70180899e.script (mintingInputs input) 1000)]
