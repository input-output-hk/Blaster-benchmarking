import CardanoLedgerApi.V3
import LiveScripts.S_69f088f0e8e7f2cb5cd9f4c4c794f2a828c0adef9cd9d4b8d53cfe59.Script
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
      ¬ isSuccessful (cekExecuteProgram script_69f088f0e8e7f2cb5cd9f4c4c794f2a828c0adef9cd9d4b8d53cfe59.script (spendingInputs ctx) 1000)]
