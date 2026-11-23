import CardanoLedgerApi.V3
import LiveScripts.S_f9724c47299e745cb4f50f9d36cbbadcdf87e015a9d99d927dc4e866.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f9724c47299e745cb4f50f9d36cbbadcdf87e015a9d99d927dc4e866.script (spendingInputs ctx) 1000)]
