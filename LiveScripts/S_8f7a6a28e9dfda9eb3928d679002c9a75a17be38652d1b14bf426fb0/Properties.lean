import CardanoLedgerApi.V3
import LiveScripts.S_8f7a6a28e9dfda9eb3928d679002c9a75a17be38652d1b14bf426fb0.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8f7a6a28e9dfda9eb3928d679002c9a75a17be38652d1b14bf426fb0.script (spendingInputs ctx) 1000)]
