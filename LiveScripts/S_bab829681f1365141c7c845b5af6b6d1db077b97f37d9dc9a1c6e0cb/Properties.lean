import CardanoLedgerApi.V3
import LiveScripts.S_bab829681f1365141c7c845b5af6b6d1db077b97f37d9dc9a1c6e0cb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_bab829681f1365141c7c845b5af6b6d1db077b97f37d9dc9a1c6e0cb.script (mintingInputs ctx) 1000)]
