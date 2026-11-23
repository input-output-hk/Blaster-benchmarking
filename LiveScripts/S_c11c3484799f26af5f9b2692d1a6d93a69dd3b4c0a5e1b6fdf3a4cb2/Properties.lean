import CardanoLedgerApi.V2
import LiveScripts.S_c11c3484799f26af5f9b2692d1a6d93a69dd3b4c0a5e1b6fdf3a4cb2.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c11c3484799f26af5f9b2692d1a6d93a69dd3b4c0a5e1b6fdf3a4cb2.script (mintingInputs input) 1000)]
