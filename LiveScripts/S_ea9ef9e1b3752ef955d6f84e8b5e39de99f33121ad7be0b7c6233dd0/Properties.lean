import CardanoLedgerApi.V3
import LiveScripts.S_ea9ef9e1b3752ef955d6f84e8b5e39de99f33121ad7be0b7c6233dd0.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ea9ef9e1b3752ef955d6f84e8b5e39de99f33121ad7be0b7c6233dd0.script (spendingInputs ctx) 1000)]
