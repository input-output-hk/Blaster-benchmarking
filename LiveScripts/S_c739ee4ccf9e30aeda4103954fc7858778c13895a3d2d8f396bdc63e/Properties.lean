import CardanoLedgerApi.V3
import LiveScripts.S_c739ee4ccf9e30aeda4103954fc7858778c13895a3d2d8f396bdc63e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c739ee4ccf9e30aeda4103954fc7858778c13895a3d2d8f396bdc63e.script (spendingInputs ctx) 1000)]
