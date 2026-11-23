import CardanoLedgerApi.V3
import LiveScripts.S_0ec6e7fc04be28f5251e8ac17c5cf68e6af101dc689cd6a21b21580e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0ec6e7fc04be28f5251e8ac17c5cf68e6af101dc689cd6a21b21580e.script (spendingInputs ctx) 1000)]
