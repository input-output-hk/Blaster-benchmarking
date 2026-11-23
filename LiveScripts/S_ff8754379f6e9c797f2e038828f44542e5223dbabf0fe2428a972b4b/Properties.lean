import CardanoLedgerApi.V2
import LiveScripts.S_ff8754379f6e9c797f2e038828f44542e5223dbabf0fe2428a972b4b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ff8754379f6e9c797f2e038828f44542e5223dbabf0fe2428a972b4b.script (mintingInputs input) 1000)]
