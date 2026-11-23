import CardanoLedgerApi.V3
import LiveScripts.S_3d9e3b63e673f56536e2df178777e05b0ae3e20a0aa3854a5a390a10.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: spend; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validSpendingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_3d9e3b63e673f56536e2df178777e05b0ae3e20a0aa3854a5a390a10.script (spendingInputs ctx) 1000)]
