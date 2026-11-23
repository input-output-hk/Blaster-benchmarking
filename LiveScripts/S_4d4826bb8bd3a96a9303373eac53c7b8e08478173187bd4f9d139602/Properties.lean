import CardanoLedgerApi.V3
import LiveScripts.S_4d4826bb8bd3a96a9303373eac53c7b8e08478173187bd4f9d139602.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4d4826bb8bd3a96a9303373eac53c7b8e08478173187bd4f9d139602.script (spendingInputs ctx) 1000)]
