import CardanoLedgerApi.V2
import LiveScripts.S_d6aae2059baee188f74917493cf7637e679cd219bdfbbf4dcbeb1d0b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d6aae2059baee188f74917493cf7637e679cd219bdfbbf4dcbeb1d0b.script (mintingInputs input) 1000)]
