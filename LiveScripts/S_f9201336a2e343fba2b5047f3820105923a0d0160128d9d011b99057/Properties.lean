import CardanoLedgerApi.V3
import LiveScripts.S_f9201336a2e343fba2b5047f3820105923a0d0160128d9d011b99057.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f9201336a2e343fba2b5047f3820105923a0d0160128d9d011b99057.script (spendingInputs ctx) 1000)]
