import CardanoLedgerApi.V3
import LiveScripts.S_6c3c17048ed01498821b7854492c2608b2b86b31dcb5f5cf7a2967dc.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6c3c17048ed01498821b7854492c2608b2b86b31dcb5f5cf7a2967dc.script (spendingInputs ctx) 1000)]
