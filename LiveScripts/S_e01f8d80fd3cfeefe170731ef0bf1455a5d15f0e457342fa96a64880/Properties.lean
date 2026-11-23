import CardanoLedgerApi.V3
import LiveScripts.S_e01f8d80fd3cfeefe170731ef0bf1455a5d15f0e457342fa96a64880.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e01f8d80fd3cfeefe170731ef0bf1455a5d15f0e457342fa96a64880.script (spendingInputs ctx) 1000)]
