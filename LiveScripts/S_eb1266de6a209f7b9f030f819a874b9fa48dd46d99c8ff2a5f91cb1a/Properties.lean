import CardanoLedgerApi.V3
import LiveScripts.S_eb1266de6a209f7b9f030f819a874b9fa48dd46d99c8ff2a5f91cb1a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_eb1266de6a209f7b9f030f819a874b9fa48dd46d99c8ff2a5f91cb1a.script (mintingInputs ctx) 1000)]
