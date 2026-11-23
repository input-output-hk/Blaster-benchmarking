import CardanoLedgerApi.V3
import LiveScripts.S_303cc9b1fb57b69530de8f0995e2f23f4c41018cd4168ab53e6bf118.Script
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
      ¬ isSuccessful (cekExecuteProgram script_303cc9b1fb57b69530de8f0995e2f23f4c41018cd4168ab53e6bf118.script (spendingInputs ctx) 1000)]
