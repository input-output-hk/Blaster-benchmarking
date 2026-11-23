import CardanoLedgerApi.V3
import LiveScripts.S_f06e28bb1c963cbb77ec19f1fb73d778d0926ccf3ececefc0307b321.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f06e28bb1c963cbb77ec19f1fb73d778d0926ccf3ececefc0307b321.script (spendingInputs ctx) 1000)]
