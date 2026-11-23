import CardanoLedgerApi.V3
import LiveScripts.S_97f078c5e9bfa9980d1cfe9a2ae74094fd23e32bd99ff8724af91e07.Script
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
      ¬ isSuccessful (cekExecuteProgram script_97f078c5e9bfa9980d1cfe9a2ae74094fd23e32bd99ff8724af91e07.script (spendingInputs ctx) 1000)]
