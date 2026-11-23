import CardanoLedgerApi.V3
import LiveScripts.S_0e2e69998e9d901881b3c72d7759930ab644aed398738b1fe0a982f3.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: mint; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validMintingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_0e2e69998e9d901881b3c72d7759930ab644aed398738b1fe0a982f3.script (mintingInputs ctx) 1000)]
