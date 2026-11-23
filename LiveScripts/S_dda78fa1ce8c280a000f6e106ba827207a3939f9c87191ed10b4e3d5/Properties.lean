import CardanoLedgerApi.V3
import LiveScripts.S_dda78fa1ce8c280a000f6e106ba827207a3939f9c87191ed10b4e3d5.Script
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
      ¬ isSuccessful (cekExecuteProgram script_dda78fa1ce8c280a000f6e106ba827207a3939f9c87191ed10b4e3d5.script (spendingInputs ctx) 1000)]
