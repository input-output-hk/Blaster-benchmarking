import CardanoLedgerApi.V3
import LiveScripts.S_f8ee1130915c4cd5f5482cc15537da54106dc2543cfba6dff41cb243.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f8ee1130915c4cd5f5482cc15537da54106dc2543cfba6dff41cb243.script (spendingInputs ctx) 1000)]
