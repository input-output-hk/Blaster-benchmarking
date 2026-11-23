import CardanoLedgerApi.V3
import LiveScripts.S_163bb361d8fc9b0e78347cc955df2750de39e0a577d6c3fd4ad0ea26.Script
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
      ¬ isSuccessful (cekExecuteProgram script_163bb361d8fc9b0e78347cc955df2750de39e0a577d6c3fd4ad0ea26.script (spendingInputs ctx) 1000)]
