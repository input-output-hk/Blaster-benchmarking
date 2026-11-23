import CardanoLedgerApi.V3
import LiveScripts.S_5fbb3e5295c211c7595ddd23db2e0a0833131e0681cc7ea800f85d34.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5fbb3e5295c211c7595ddd23db2e0a0833131e0681cc7ea800f85d34.script (spendingInputs ctx) 1000)]
