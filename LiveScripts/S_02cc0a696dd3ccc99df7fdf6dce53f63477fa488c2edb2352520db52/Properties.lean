import CardanoLedgerApi.V3
import LiveScripts.S_02cc0a696dd3ccc99df7fdf6dce53f63477fa488c2edb2352520db52.Script
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
      ¬ isSuccessful (cekExecuteProgram script_02cc0a696dd3ccc99df7fdf6dce53f63477fa488c2edb2352520db52.script (spendingInputs ctx) 1000)]
