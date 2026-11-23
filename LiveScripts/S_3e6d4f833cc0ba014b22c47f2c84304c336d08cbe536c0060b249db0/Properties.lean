import CardanoLedgerApi.V3
import LiveScripts.S_3e6d4f833cc0ba014b22c47f2c84304c336d08cbe536c0060b249db0.Script
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
      ¬ isSuccessful (cekExecuteProgram script_3e6d4f833cc0ba014b22c47f2c84304c336d08cbe536c0060b249db0.script (spendingInputs ctx) 1000)]
