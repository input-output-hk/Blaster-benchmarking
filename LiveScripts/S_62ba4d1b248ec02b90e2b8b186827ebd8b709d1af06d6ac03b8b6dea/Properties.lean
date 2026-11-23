import CardanoLedgerApi.V3
import LiveScripts.S_62ba4d1b248ec02b90e2b8b186827ebd8b709d1af06d6ac03b8b6dea.Script
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
      ¬ isSuccessful (cekExecuteProgram script_62ba4d1b248ec02b90e2b8b186827ebd8b709d1af06d6ac03b8b6dea.script (spendingInputs ctx) 1000)]
