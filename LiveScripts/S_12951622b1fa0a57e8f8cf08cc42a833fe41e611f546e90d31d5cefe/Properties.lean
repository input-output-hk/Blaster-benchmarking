import CardanoLedgerApi.V3
import LiveScripts.S_12951622b1fa0a57e8f8cf08cc42a833fe41e611f546e90d31d5cefe.Script
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
      ¬ isSuccessful (cekExecuteProgram script_12951622b1fa0a57e8f8cf08cc42a833fe41e611f546e90d31d5cefe.script (spendingInputs ctx) 1000)]
