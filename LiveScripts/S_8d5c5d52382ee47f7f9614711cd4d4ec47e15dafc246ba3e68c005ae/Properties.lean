import CardanoLedgerApi.V3
import LiveScripts.S_8d5c5d52382ee47f7f9614711cd4d4ec47e15dafc246ba3e68c005ae.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8d5c5d52382ee47f7f9614711cd4d4ec47e15dafc246ba3e68c005ae.script (spendingInputs ctx) 1000)]
