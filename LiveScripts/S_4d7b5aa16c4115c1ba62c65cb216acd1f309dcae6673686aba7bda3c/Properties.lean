import CardanoLedgerApi.V3
import LiveScripts.S_4d7b5aa16c4115c1ba62c65cb216acd1f309dcae6673686aba7bda3c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4d7b5aa16c4115c1ba62c65cb216acd1f309dcae6673686aba7bda3c.script (spendingInputs ctx) 1000)]
