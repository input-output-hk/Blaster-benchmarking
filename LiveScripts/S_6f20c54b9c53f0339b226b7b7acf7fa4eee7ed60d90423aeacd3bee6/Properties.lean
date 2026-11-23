import CardanoLedgerApi.V3
import LiveScripts.S_6f20c54b9c53f0339b226b7b7acf7fa4eee7ed60d90423aeacd3bee6.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6f20c54b9c53f0339b226b7b7acf7fa4eee7ed60d90423aeacd3bee6.script (spendingInputs ctx) 1000)]
