import CardanoLedgerApi.V3
import LiveScripts.S_181b3db063ec5c7e12803b609c5f5d2c31d4611f3fbb49e97d564237.Script
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
      ¬ isSuccessful (cekExecuteProgram script_181b3db063ec5c7e12803b609c5f5d2c31d4611f3fbb49e97d564237.script (spendingInputs ctx) 1000)]
