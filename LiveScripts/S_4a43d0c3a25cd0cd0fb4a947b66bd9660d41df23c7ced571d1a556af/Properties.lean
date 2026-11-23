import CardanoLedgerApi.V3
import LiveScripts.S_4a43d0c3a25cd0cd0fb4a947b66bd9660d41df23c7ced571d1a556af.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4a43d0c3a25cd0cd0fb4a947b66bd9660d41df23c7ced571d1a556af.script (spendingInputs ctx) 1000)]
