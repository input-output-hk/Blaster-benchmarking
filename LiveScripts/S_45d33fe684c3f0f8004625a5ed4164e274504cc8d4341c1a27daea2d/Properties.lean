import CardanoLedgerApi.V3
import LiveScripts.S_45d33fe684c3f0f8004625a5ed4164e274504cc8d4341c1a27daea2d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_45d33fe684c3f0f8004625a5ed4164e274504cc8d4341c1a27daea2d.script (spendingInputs ctx) 1000)]
