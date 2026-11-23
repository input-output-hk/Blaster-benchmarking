import CardanoLedgerApi.V3
import LiveScripts.S_fc383e1cc6e6c6658e8f03932b923b3020aff0a1f202540285e43cf6.Script
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
      ¬ isSuccessful (cekExecuteProgram script_fc383e1cc6e6c6658e8f03932b923b3020aff0a1f202540285e43cf6.script (spendingInputs ctx) 1000)]
