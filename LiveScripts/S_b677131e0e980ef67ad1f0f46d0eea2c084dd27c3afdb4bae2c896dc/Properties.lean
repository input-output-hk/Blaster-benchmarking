import CardanoLedgerApi.V3
import LiveScripts.S_b677131e0e980ef67ad1f0f46d0eea2c084dd27c3afdb4bae2c896dc.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b677131e0e980ef67ad1f0f46d0eea2c084dd27c3afdb4bae2c896dc.script (spendingInputs ctx) 1000)]
