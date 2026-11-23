import CardanoLedgerApi.V3
import LiveScripts.S_5fd1fe290511529688c84b0eb05e32172a88e38c24d39cbcbd7f82bd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5fd1fe290511529688c84b0eb05e32172a88e38c24d39cbcbd7f82bd.script (spendingInputs ctx) 1000)]
