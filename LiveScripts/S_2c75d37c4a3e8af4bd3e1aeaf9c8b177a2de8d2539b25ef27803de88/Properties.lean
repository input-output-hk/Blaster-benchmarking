import CardanoLedgerApi.V3
import LiveScripts.S_2c75d37c4a3e8af4bd3e1aeaf9c8b177a2de8d2539b25ef27803de88.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2c75d37c4a3e8af4bd3e1aeaf9c8b177a2de8d2539b25ef27803de88.script (spendingInputs ctx) 1000)]
