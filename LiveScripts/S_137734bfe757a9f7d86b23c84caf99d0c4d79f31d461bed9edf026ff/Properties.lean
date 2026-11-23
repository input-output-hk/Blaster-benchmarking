import CardanoLedgerApi.V3
import LiveScripts.S_137734bfe757a9f7d86b23c84caf99d0c4d79f31d461bed9edf026ff.Script
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
      ¬ isSuccessful (cekExecuteProgram script_137734bfe757a9f7d86b23c84caf99d0c4d79f31d461bed9edf026ff.script (spendingInputs ctx) 1000)]
