import CardanoLedgerApi.V3
import LiveScripts.S_07eb2fb09d9dd6603870ce6f84c8f8506249152173ddf0c77f1f07ec.Script
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
      ¬ isSuccessful (cekExecuteProgram script_07eb2fb09d9dd6603870ce6f84c8f8506249152173ddf0c77f1f07ec.script (spendingInputs ctx) 1000)]
