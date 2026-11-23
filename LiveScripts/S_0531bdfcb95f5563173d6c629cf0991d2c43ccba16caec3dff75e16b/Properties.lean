import CardanoLedgerApi.V3
import LiveScripts.S_0531bdfcb95f5563173d6c629cf0991d2c43ccba16caec3dff75e16b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0531bdfcb95f5563173d6c629cf0991d2c43ccba16caec3dff75e16b.script (spendingInputs ctx) 1000)]
