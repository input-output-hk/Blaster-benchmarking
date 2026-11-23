import CardanoLedgerApi.V3
import LiveScripts.S_09256a3613d5ed5ce866351e84dcd3d67b21ba9cde9cf635599fbbe8.Script
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
      ¬ isSuccessful (cekExecuteProgram script_09256a3613d5ed5ce866351e84dcd3d67b21ba9cde9cf635599fbbe8.script (spendingInputs ctx) 1000)]
