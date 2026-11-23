import CardanoLedgerApi.V1
import LiveScripts.S_a4864d7e8ceed0e001d5c7df62149c5fb206551862180dc0f7db2bb2.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a4864d7e8ceed0e001d5c7df62149c5fb206551862180dc0f7db2bb2.script (mintingInputs input) 1000)]
