import CardanoLedgerApi.V3
import LiveScripts.S_21c9b7b965646069f9becebf8b4c3cedaf84c19b109eaa5980a14a26.Script
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
      ¬ isSuccessful (cekExecuteProgram script_21c9b7b965646069f9becebf8b4c3cedaf84c19b109eaa5980a14a26.script (spendingInputs ctx) 1000)]
