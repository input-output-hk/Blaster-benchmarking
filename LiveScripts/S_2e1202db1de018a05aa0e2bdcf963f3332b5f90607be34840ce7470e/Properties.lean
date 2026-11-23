import CardanoLedgerApi.V1
import LiveScripts.S_2e1202db1de018a05aa0e2bdcf963f3332b5f90607be34840ce7470e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2e1202db1de018a05aa0e2bdcf963f3332b5f90607be34840ce7470e.script (mintingInputs input) 1000)]
