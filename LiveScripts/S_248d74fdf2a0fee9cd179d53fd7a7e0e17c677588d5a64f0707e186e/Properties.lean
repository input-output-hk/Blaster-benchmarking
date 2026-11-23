import CardanoLedgerApi.V1
import LiveScripts.S_248d74fdf2a0fee9cd179d53fd7a7e0e17c677588d5a64f0707e186e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_248d74fdf2a0fee9cd179d53fd7a7e0e17c677588d5a64f0707e186e.script (mintingInputs input) 1000)]
