import CardanoLedgerApi.V3
import LiveScripts.S_c49ced27b474479b325f621ed18cd1d82acc6f427dd83cbd0e9c0853.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c49ced27b474479b325f621ed18cd1d82acc6f427dd83cbd0e9c0853.script (spendingInputs ctx) 1000)]
