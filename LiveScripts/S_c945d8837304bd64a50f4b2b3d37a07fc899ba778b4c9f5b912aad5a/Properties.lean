import CardanoLedgerApi.V3
import LiveScripts.S_c945d8837304bd64a50f4b2b3d37a07fc899ba778b4c9f5b912aad5a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c945d8837304bd64a50f4b2b3d37a07fc899ba778b4c9f5b912aad5a.script (spendingInputs ctx) 1000)]
