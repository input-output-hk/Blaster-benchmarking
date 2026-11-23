import CardanoLedgerApi.V3
import LiveScripts.S_7e71023cda756f3098c33f1d27ad09b2bf01c0b68be8a3eb3247b8cc.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7e71023cda756f3098c33f1d27ad09b2bf01c0b68be8a3eb3247b8cc.script (spendingInputs ctx) 1000)]
