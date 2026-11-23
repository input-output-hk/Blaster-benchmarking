import CardanoLedgerApi.V3
import LiveScripts.S_b81afcbb6d78b66eb7cbfcc7a66ca0dde1f0cb254f6906dd9e2a1441.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b81afcbb6d78b66eb7cbfcc7a66ca0dde1f0cb254f6906dd9e2a1441.script (spendingInputs ctx) 1000)]
