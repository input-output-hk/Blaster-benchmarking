import CardanoLedgerApi.V3
import LiveScripts.S_2411b885f0c0340e4cfa237b092f4a17b255d33c6a85f4f8d231c6db.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2411b885f0c0340e4cfa237b092f4a17b255d33c6a85f4f8d231c6db.script (spendingInputs ctx) 1000)]
