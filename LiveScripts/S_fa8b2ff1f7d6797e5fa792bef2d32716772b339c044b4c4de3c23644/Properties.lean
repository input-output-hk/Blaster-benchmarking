import CardanoLedgerApi.V3
import LiveScripts.S_fa8b2ff1f7d6797e5fa792bef2d32716772b339c044b4c4de3c23644.Script
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
      ¬ isSuccessful (cekExecuteProgram script_fa8b2ff1f7d6797e5fa792bef2d32716772b339c044b4c4de3c23644.script (spendingInputs ctx) 1000)]
