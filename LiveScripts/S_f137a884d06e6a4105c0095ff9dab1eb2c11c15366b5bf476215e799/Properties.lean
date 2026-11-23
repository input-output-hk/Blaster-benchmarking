import CardanoLedgerApi.V3
import LiveScripts.S_f137a884d06e6a4105c0095ff9dab1eb2c11c15366b5bf476215e799.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f137a884d06e6a4105c0095ff9dab1eb2c11c15366b5bf476215e799.script (spendingInputs ctx) 1000)]
