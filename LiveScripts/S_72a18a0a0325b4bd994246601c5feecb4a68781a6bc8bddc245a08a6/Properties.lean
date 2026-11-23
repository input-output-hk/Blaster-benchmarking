import CardanoLedgerApi.V3
import LiveScripts.S_72a18a0a0325b4bd994246601c5feecb4a68781a6bc8bddc245a08a6.Script
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
      ¬ isSuccessful (cekExecuteProgram script_72a18a0a0325b4bd994246601c5feecb4a68781a6bc8bddc245a08a6.script (spendingInputs ctx) 1000)]
