import CardanoLedgerApi.V3
import LiveScripts.S_96275a82fd193243a6e5d6f475400e4f9b70c6de7c4df46ea501fa1c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_96275a82fd193243a6e5d6f475400e4f9b70c6de7c4df46ea501fa1c.script (mintingInputs ctx) 1000)]
