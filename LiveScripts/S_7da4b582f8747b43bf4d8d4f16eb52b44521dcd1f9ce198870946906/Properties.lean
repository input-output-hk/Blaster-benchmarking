import CardanoLedgerApi.V3
import LiveScripts.S_7da4b582f8747b43bf4d8d4f16eb52b44521dcd1f9ce198870946906.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7da4b582f8747b43bf4d8d4f16eb52b44521dcd1f9ce198870946906.script (spendingInputs ctx) 1000)]
