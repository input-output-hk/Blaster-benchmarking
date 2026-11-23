import CardanoLedgerApi.V2
import LiveScripts.S_24af1a829b2a56457dbeb02e854a0f0af1e7d0af4233aaa0c0d7b1e1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_24af1a829b2a56457dbeb02e854a0f0af1e7d0af4233aaa0c0d7b1e1.script (mintingInputs input) 1000)]
