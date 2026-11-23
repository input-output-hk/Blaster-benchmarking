import CardanoLedgerApi.V2
import LiveScripts.S_443c51db609bba8b2aa4c8af248bf797cbfcfa1e413c443296a50813.Script
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
      ¬ isSuccessful (cekExecuteProgram script_443c51db609bba8b2aa4c8af248bf797cbfcfa1e413c443296a50813.script (mintingInputs input) 1000)]
