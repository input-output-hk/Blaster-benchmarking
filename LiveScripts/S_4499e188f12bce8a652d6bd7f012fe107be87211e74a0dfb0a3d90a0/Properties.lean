import CardanoLedgerApi.V3
import LiveScripts.S_4499e188f12bce8a652d6bd7f012fe107be87211e74a0dfb0a3d90a0.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4499e188f12bce8a652d6bd7f012fe107be87211e74a0dfb0a3d90a0.script (spendingInputs ctx) 1000)]
