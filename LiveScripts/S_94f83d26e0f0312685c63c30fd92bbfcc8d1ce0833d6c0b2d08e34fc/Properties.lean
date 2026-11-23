import CardanoLedgerApi.V3
import LiveScripts.S_94f83d26e0f0312685c63c30fd92bbfcc8d1ce0833d6c0b2d08e34fc.Script
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
      ¬ isSuccessful (cekExecuteProgram script_94f83d26e0f0312685c63c30fd92bbfcc8d1ce0833d6c0b2d08e34fc.script (spendingInputs ctx) 1000)]
