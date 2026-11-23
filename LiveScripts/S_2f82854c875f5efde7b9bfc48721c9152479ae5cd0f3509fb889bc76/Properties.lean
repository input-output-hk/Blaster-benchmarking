import CardanoLedgerApi.V3
import LiveScripts.S_2f82854c875f5efde7b9bfc48721c9152479ae5cd0f3509fb889bc76.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2f82854c875f5efde7b9bfc48721c9152479ae5cd0f3509fb889bc76.script (spendingInputs ctx) 1000)]
