import CardanoLedgerApi.V3
import LiveScripts.S_2ba3f2f4e9fddee45aea9202cd6b4b5cbc9fcdee938d4a7f61f30bd1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2ba3f2f4e9fddee45aea9202cd6b4b5cbc9fcdee938d4a7f61f30bd1.script (spendingInputs ctx) 1000)]
