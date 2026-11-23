import CardanoLedgerApi.V3
import LiveScripts.S_0ae68f6ca94c61a10eccdf90f8d08c328f1d518c79e6a2c7f99a272e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0ae68f6ca94c61a10eccdf90f8d08c328f1d518c79e6a2c7f99a272e.script (spendingInputs ctx) 1000)]
