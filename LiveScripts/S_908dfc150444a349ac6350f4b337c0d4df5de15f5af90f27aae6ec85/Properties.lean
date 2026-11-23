import CardanoLedgerApi.V3
import LiveScripts.S_908dfc150444a349ac6350f4b337c0d4df5de15f5af90f27aae6ec85.Script
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
      ¬ isSuccessful (cekExecuteProgram script_908dfc150444a349ac6350f4b337c0d4df5de15f5af90f27aae6ec85.script (spendingInputs ctx) 1000)]
