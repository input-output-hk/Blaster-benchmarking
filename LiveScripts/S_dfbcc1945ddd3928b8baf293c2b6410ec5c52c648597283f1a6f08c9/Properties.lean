import CardanoLedgerApi.V3
import LiveScripts.S_dfbcc1945ddd3928b8baf293c2b6410ec5c52c648597283f1a6f08c9.Script
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
      ¬ isSuccessful (cekExecuteProgram script_dfbcc1945ddd3928b8baf293c2b6410ec5c52c648597283f1a6f08c9.script (spendingInputs ctx) 1000)]
