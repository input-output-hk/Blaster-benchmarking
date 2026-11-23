import CardanoLedgerApi.V3
import LiveScripts.S_9fe89059a6d59d7d5b9648425d76d8d7aaaef41e0c950de1faf48005.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9fe89059a6d59d7d5b9648425d76d8d7aaaef41e0c950de1faf48005.script (spendingInputs ctx) 1000)]
