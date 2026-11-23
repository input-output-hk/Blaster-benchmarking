import CardanoLedgerApi.V1
import LiveScripts.S_f5f91e62e38fb5689e4e03e19c41a773a079684f2dd4b77be24caf5d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f5f91e62e38fb5689e4e03e19c41a773a079684f2dd4b77be24caf5d.script (mintingInputs input) 1000)]
