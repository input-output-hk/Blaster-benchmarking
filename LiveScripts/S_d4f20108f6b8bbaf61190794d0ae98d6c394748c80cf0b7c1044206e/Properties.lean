import CardanoLedgerApi.V3
import LiveScripts.S_d4f20108f6b8bbaf61190794d0ae98d6c394748c80cf0b7c1044206e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d4f20108f6b8bbaf61190794d0ae98d6c394748c80cf0b7c1044206e.script (mintingInputs ctx) 1000)]
