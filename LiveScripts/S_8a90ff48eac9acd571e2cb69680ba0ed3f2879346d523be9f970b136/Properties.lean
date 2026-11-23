import CardanoLedgerApi.V3
import LiveScripts.S_8a90ff48eac9acd571e2cb69680ba0ed3f2879346d523be9f970b136.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8a90ff48eac9acd571e2cb69680ba0ed3f2879346d523be9f970b136.script (mintingInputs ctx) 1000)]
