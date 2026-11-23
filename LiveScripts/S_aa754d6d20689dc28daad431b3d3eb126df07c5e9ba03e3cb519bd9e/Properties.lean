import CardanoLedgerApi.V3
import LiveScripts.S_aa754d6d20689dc28daad431b3d3eb126df07c5e9ba03e3cb519bd9e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_aa754d6d20689dc28daad431b3d3eb126df07c5e9ba03e3cb519bd9e.script (spendingInputs ctx) 1000)]
