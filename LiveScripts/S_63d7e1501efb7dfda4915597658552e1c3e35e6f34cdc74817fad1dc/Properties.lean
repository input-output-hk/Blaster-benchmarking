import CardanoLedgerApi.V2
import LiveScripts.S_63d7e1501efb7dfda4915597658552e1c3e35e6f34cdc74817fad1dc.Script
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
      ¬ isSuccessful (cekExecuteProgram script_63d7e1501efb7dfda4915597658552e1c3e35e6f34cdc74817fad1dc.script (mintingInputs input) 1000)]
