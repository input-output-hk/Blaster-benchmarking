import CardanoLedgerApi.V3
import LiveScripts.S_d7d79bc5edff9564fdcdda1ac2e7518c1af6ce5f8c61621396454792.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d7d79bc5edff9564fdcdda1ac2e7518c1af6ce5f8c61621396454792.script (spendingInputs ctx) 1000)]
