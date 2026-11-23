import CardanoLedgerApi.V1
import LiveScripts.S_e7381bab7d8eb0298d7ee6801d723db246846b221e938f8de3eaeac2.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e7381bab7d8eb0298d7ee6801d723db246846b221e938f8de3eaeac2.script (mintingInputs input) 1000)]
