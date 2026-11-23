import CardanoLedgerApi.V3
import LiveScripts.S_07f9840cc1855457af29510a4a05d0424d75bc0a4e67cb02b8b55269.Script
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
      ¬ isSuccessful (cekExecuteProgram script_07f9840cc1855457af29510a4a05d0424d75bc0a4e67cb02b8b55269.script (spendingInputs ctx) 1000)]
