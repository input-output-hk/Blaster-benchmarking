import CardanoLedgerApi.V3
import LiveScripts.S_9dd2cf3ac8e9d2c442cf767d64dc9920b46573a74e600dd6108894d0.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9dd2cf3ac8e9d2c442cf767d64dc9920b46573a74e600dd6108894d0.script (spendingInputs ctx) 1000)]
