import CardanoLedgerApi.V3
import LiveScripts.S_9b06fc85e5adfe2d69cab7cdeae544f9a6d2162a71ee593ef2921139.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9b06fc85e5adfe2d69cab7cdeae544f9a6d2162a71ee593ef2921139.script (spendingInputs ctx) 1000)]
