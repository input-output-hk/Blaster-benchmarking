import CardanoLedgerApi.V3
import LiveScripts.S_cdf1e9952e2a1fa21b519a2701a240b8e54f78531481ed79136e2818.Script
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
      ¬ isSuccessful (cekExecuteProgram script_cdf1e9952e2a1fa21b519a2701a240b8e54f78531481ed79136e2818.script (spendingInputs ctx) 1000)]
