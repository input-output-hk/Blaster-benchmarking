import CardanoLedgerApi.V3
import LiveScripts.S_9e7dc5f78f2426bbec790bfb515baa6c0a170a3d8170cf46ba55c885.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9e7dc5f78f2426bbec790bfb515baa6c0a170a3d8170cf46ba55c885.script (spendingInputs ctx) 1000)]
