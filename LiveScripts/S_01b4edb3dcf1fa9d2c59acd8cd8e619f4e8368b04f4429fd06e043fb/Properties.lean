import CardanoLedgerApi.V1
import LiveScripts.S_01b4edb3dcf1fa9d2c59acd8cd8e619f4e8368b04f4429fd06e043fb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_01b4edb3dcf1fa9d2c59acd8cd8e619f4e8368b04f4429fd06e043fb.script (mintingInputs input) 1000)]
