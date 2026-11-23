import CardanoLedgerApi.V3
import LiveScripts.S_99abe34f9b61c6893dc9abe828bd828dece4f5a4fc1aa3b47c5d21a3.Script
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
      ¬ isSuccessful (cekExecuteProgram script_99abe34f9b61c6893dc9abe828bd828dece4f5a4fc1aa3b47c5d21a3.script (spendingInputs ctx) 1000)]
