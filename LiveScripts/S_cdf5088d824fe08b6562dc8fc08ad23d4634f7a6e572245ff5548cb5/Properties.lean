import CardanoLedgerApi.V3
import LiveScripts.S_cdf5088d824fe08b6562dc8fc08ad23d4634f7a6e572245ff5548cb5.Script
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
      ¬ isSuccessful (cekExecuteProgram script_cdf5088d824fe08b6562dc8fc08ad23d4634f7a6e572245ff5548cb5.script (spendingInputs ctx) 1000)]
