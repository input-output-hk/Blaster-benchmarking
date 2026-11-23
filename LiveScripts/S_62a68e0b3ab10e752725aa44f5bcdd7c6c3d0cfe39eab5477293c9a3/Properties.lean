import CardanoLedgerApi.V3
import LiveScripts.S_62a68e0b3ab10e752725aa44f5bcdd7c6c3d0cfe39eab5477293c9a3.Script
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
      ¬ isSuccessful (cekExecuteProgram script_62a68e0b3ab10e752725aa44f5bcdd7c6c3d0cfe39eab5477293c9a3.script (spendingInputs ctx) 1000)]
