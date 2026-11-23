import CardanoLedgerApi.V3
import LiveScripts.S_ebde68ce82b8a7a15c4b58a4a31001f959988f1fb7aa40adae3f44d5.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ebde68ce82b8a7a15c4b58a4a31001f959988f1fb7aa40adae3f44d5.script (spendingInputs ctx) 1000)]
