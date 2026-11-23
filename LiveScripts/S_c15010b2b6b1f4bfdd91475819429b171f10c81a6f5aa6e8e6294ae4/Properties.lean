import CardanoLedgerApi.V1
import LiveScripts.S_c15010b2b6b1f4bfdd91475819429b171f10c81a6f5aa6e8e6294ae4.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c15010b2b6b1f4bfdd91475819429b171f10c81a6f5aa6e8e6294ae4.script (mintingInputs input) 1000)]
