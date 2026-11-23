import CardanoLedgerApi.V3
import LiveScripts.S_a6f2b9ce903f5048fe09087f0433ad853f952e1abac2c9088bfb1cc4.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a6f2b9ce903f5048fe09087f0433ad853f952e1abac2c9088bfb1cc4.script (spendingInputs ctx) 1000)]
