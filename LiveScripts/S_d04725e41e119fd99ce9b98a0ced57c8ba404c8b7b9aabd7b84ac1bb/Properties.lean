import CardanoLedgerApi.V3
import LiveScripts.S_d04725e41e119fd99ce9b98a0ced57c8ba404c8b7b9aabd7b84ac1bb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d04725e41e119fd99ce9b98a0ced57c8ba404c8b7b9aabd7b84ac1bb.script (spendingInputs ctx) 1000)]
