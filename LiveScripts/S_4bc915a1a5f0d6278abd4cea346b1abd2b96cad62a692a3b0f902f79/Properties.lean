import CardanoLedgerApi.V3
import LiveScripts.S_4bc915a1a5f0d6278abd4cea346b1abd2b96cad62a692a3b0f902f79.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4bc915a1a5f0d6278abd4cea346b1abd2b96cad62a692a3b0f902f79.script (spendingInputs ctx) 1000)]
