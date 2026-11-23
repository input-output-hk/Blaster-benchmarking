import CardanoLedgerApi.V3
import LiveScripts.S_c030d7bb58a661dd82c30fa8af669c11e38fb009442f4acd2e0af178.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c030d7bb58a661dd82c30fa8af669c11e38fb009442f4acd2e0af178.script (spendingInputs ctx) 1000)]
