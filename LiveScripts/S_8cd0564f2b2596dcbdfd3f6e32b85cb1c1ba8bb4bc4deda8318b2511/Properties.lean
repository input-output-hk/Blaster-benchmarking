import CardanoLedgerApi.V3
import LiveScripts.S_8cd0564f2b2596dcbdfd3f6e32b85cb1c1ba8bb4bc4deda8318b2511.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8cd0564f2b2596dcbdfd3f6e32b85cb1c1ba8bb4bc4deda8318b2511.script (mintingInputs ctx) 1000)]
