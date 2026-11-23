import CardanoLedgerApi.V3
import LiveScripts.S_99bcd6718bc93c4f0815840cd0ef2b7d4aa0866520a29e4eb6c175a4.Script
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
      ¬ isSuccessful (cekExecuteProgram script_99bcd6718bc93c4f0815840cd0ef2b7d4aa0866520a29e4eb6c175a4.script (spendingInputs ctx) 1000)]
