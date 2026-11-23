import CardanoLedgerApi.V3
import LiveScripts.S_714205696502e4ca307c1617422e1a7c6b5f8cdcd84cc9c6cb4edc36.Script
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
      ¬ isSuccessful (cekExecuteProgram script_714205696502e4ca307c1617422e1a7c6b5f8cdcd84cc9c6cb4edc36.script (spendingInputs ctx) 1000)]
