import CardanoLedgerApi.V3
import LiveScripts.S_eeea2dd2ce5fd8a9817c3d03a4106753cd1bdc61864bfc6ab8bd511e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_eeea2dd2ce5fd8a9817c3d03a4106753cd1bdc61864bfc6ab8bd511e.script (spendingInputs ctx) 1000)]
