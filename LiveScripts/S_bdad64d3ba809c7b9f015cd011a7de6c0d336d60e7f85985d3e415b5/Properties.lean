import CardanoLedgerApi.V3
import LiveScripts.S_bdad64d3ba809c7b9f015cd011a7de6c0d336d60e7f85985d3e415b5.Script
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
      ¬ isSuccessful (cekExecuteProgram script_bdad64d3ba809c7b9f015cd011a7de6c0d336d60e7f85985d3e415b5.script (spendingInputs ctx) 1000)]
