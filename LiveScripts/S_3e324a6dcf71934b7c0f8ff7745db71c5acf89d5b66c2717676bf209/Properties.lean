import CardanoLedgerApi.V3
import LiveScripts.S_3e324a6dcf71934b7c0f8ff7745db71c5acf89d5b66c2717676bf209.Script
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
      ¬ isSuccessful (cekExecuteProgram script_3e324a6dcf71934b7c0f8ff7745db71c5acf89d5b66c2717676bf209.script (spendingInputs ctx) 1000)]
