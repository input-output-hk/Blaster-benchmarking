import CardanoLedgerApi.V3
import LiveScripts.S_66d0304bfa014cc54b7940010108da5a2b8d2e62c20a26e9399e1ca1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_66d0304bfa014cc54b7940010108da5a2b8d2e62c20a26e9399e1ca1.script (spendingInputs ctx) 1000)]
