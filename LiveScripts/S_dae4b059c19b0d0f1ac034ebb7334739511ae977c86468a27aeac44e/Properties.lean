import CardanoLedgerApi.V3
import LiveScripts.S_dae4b059c19b0d0f1ac034ebb7334739511ae977c86468a27aeac44e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_dae4b059c19b0d0f1ac034ebb7334739511ae977c86468a27aeac44e.script (spendingInputs ctx) 1000)]
