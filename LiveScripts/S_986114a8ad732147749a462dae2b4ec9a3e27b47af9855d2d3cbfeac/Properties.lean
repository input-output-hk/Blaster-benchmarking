import CardanoLedgerApi.V3
import LiveScripts.S_986114a8ad732147749a462dae2b4ec9a3e27b47af9855d2d3cbfeac.Script
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
      ¬ isSuccessful (cekExecuteProgram script_986114a8ad732147749a462dae2b4ec9a3e27b47af9855d2d3cbfeac.script (spendingInputs ctx) 1000)]
