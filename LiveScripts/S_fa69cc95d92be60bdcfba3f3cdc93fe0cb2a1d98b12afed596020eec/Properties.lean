import CardanoLedgerApi.V3
import LiveScripts.S_fa69cc95d92be60bdcfba3f3cdc93fe0cb2a1d98b12afed596020eec.Script
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
      ¬ isSuccessful (cekExecuteProgram script_fa69cc95d92be60bdcfba3f3cdc93fe0cb2a1d98b12afed596020eec.script (spendingInputs ctx) 1000)]
