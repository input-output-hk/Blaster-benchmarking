import CardanoLedgerApi.V3
import LiveScripts.S_2a198ab2cab49aa5752beb03c5d348c9593aaec20738c9f85f347f62.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2a198ab2cab49aa5752beb03c5d348c9593aaec20738c9f85f347f62.script (spendingInputs ctx) 1000)]
