import CardanoLedgerApi.V3
import LiveScripts.S_c0a3944283a2cb0a41480f09a198ef3d411f76bdd88f8508467551ec.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c0a3944283a2cb0a41480f09a198ef3d411f76bdd88f8508467551ec.script (spendingInputs ctx) 1000)]
