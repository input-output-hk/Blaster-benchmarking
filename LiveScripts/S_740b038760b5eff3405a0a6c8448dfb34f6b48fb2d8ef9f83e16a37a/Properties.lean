import CardanoLedgerApi.V3
import LiveScripts.S_740b038760b5eff3405a0a6c8448dfb34f6b48fb2d8ef9f83e16a37a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_740b038760b5eff3405a0a6c8448dfb34f6b48fb2d8ef9f83e16a37a.script (spendingInputs ctx) 1000)]
