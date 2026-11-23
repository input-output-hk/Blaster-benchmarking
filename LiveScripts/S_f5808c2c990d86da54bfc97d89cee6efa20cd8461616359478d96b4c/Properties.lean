import CardanoLedgerApi.V2
import LiveScripts.S_f5808c2c990d86da54bfc97d89cee6efa20cd8461616359478d96b4c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f5808c2c990d86da54bfc97d89cee6efa20cd8461616359478d96b4c.script (mintingInputs input) 1000)]
