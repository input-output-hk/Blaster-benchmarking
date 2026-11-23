import CardanoLedgerApi.V2
import LiveScripts.S_2472ba5bdcaaf36c28f2e495a0bf02014497c6fc0d78f86db2bcaf26.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2472ba5bdcaaf36c28f2e495a0bf02014497c6fc0d78f86db2bcaf26.script (mintingInputs input) 1000)]
