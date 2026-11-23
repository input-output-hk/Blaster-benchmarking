import CardanoLedgerApi.V3
import LiveScripts.S_73d8a23a1e4faf8daa7c5d6b14ac340bab3e75eee2374d54b1c183d5.Script
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
      ¬ isSuccessful (cekExecuteProgram script_73d8a23a1e4faf8daa7c5d6b14ac340bab3e75eee2374d54b1c183d5.script (spendingInputs ctx) 1000)]
