import CardanoLedgerApi.V3
import LiveScripts.S_3016010d2ba7a6c112c2dd8958da8b3ab4e4f4ae63d3cc60fdb5674d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_3016010d2ba7a6c112c2dd8958da8b3ab4e4f4ae63d3cc60fdb5674d.script (spendingInputs ctx) 1000)]
