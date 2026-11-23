import CardanoLedgerApi.V3
import LiveScripts.S_306dfe1f3f35dea76796ad0b2547f1bcdd9b333051a0d87dde0b8b42.Script
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
      ¬ isSuccessful (cekExecuteProgram script_306dfe1f3f35dea76796ad0b2547f1bcdd9b333051a0d87dde0b8b42.script (spendingInputs ctx) 1000)]
