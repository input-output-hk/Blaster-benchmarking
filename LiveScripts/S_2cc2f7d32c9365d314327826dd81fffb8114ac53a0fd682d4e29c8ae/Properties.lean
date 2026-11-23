import CardanoLedgerApi.V3
import LiveScripts.S_2cc2f7d32c9365d314327826dd81fffb8114ac53a0fd682d4e29c8ae.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2cc2f7d32c9365d314327826dd81fffb8114ac53a0fd682d4e29c8ae.script (spendingInputs ctx) 1000)]
