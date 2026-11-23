import CardanoLedgerApi.V3
import LiveScripts.S_94da125f1c5560777bdc1aa2e4ff141cf84e7c000f3e6787c7e7cb5d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_94da125f1c5560777bdc1aa2e4ff141cf84e7c000f3e6787c7e7cb5d.script (spendingInputs ctx) 1000)]
