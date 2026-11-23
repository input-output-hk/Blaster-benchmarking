import CardanoLedgerApi.V3
import LiveScripts.S_9b8dedd68897533c29317db59d47e1ba1924b5b58f6b681d4eb6f14f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9b8dedd68897533c29317db59d47e1ba1924b5b58f6b681d4eb6f14f.script (spendingInputs ctx) 1000)]
