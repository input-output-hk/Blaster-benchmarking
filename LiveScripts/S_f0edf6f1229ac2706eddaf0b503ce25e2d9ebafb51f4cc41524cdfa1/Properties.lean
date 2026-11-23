import CardanoLedgerApi.V3
import LiveScripts.S_f0edf6f1229ac2706eddaf0b503ce25e2d9ebafb51f4cc41524cdfa1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f0edf6f1229ac2706eddaf0b503ce25e2d9ebafb51f4cc41524cdfa1.script (spendingInputs ctx) 1000)]
