import CardanoLedgerApi.V3
import LiveScripts.S_f0bdb73a9fe70b6c0781b7a7466274dce6d78c7bd3e8fcb4244935e2.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f0bdb73a9fe70b6c0781b7a7466274dce6d78c7bd3e8fcb4244935e2.script (spendingInputs ctx) 1000)]
