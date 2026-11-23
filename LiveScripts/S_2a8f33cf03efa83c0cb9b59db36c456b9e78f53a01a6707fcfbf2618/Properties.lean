import CardanoLedgerApi.V3
import LiveScripts.S_2a8f33cf03efa83c0cb9b59db36c456b9e78f53a01a6707fcfbf2618.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2a8f33cf03efa83c0cb9b59db36c456b9e78f53a01a6707fcfbf2618.script (spendingInputs ctx) 1000)]
