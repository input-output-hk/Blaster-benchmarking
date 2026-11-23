import CardanoLedgerApi.V3
import LiveScripts.S_c0e65618da9d3d39d20d0f7cdefc6481aebe616fe063a447d8647c90.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c0e65618da9d3d39d20d0f7cdefc6481aebe616fe063a447d8647c90.script (mintingInputs ctx) 1000)]
