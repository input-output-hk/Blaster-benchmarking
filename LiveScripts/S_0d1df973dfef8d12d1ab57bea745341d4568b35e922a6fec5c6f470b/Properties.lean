import CardanoLedgerApi.V3
import LiveScripts.S_0d1df973dfef8d12d1ab57bea745341d4568b35e922a6fec5c6f470b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0d1df973dfef8d12d1ab57bea745341d4568b35e922a6fec5c6f470b.script (spendingInputs ctx) 1000)]
