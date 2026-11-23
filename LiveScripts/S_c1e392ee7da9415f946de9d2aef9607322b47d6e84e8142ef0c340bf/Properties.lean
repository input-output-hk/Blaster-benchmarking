import CardanoLedgerApi.V3
import LiveScripts.S_c1e392ee7da9415f946de9d2aef9607322b47d6e84e8142ef0c340bf.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c1e392ee7da9415f946de9d2aef9607322b47d6e84e8142ef0c340bf.script (spendingInputs ctx) 1000)]
