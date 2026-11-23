import CardanoLedgerApi.V3
import LiveScripts.S_5c54b2070b248c4036c0e4aae07a33bf154593ee6ea608d8215d86b8.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5c54b2070b248c4036c0e4aae07a33bf154593ee6ea608d8215d86b8.script (spendingInputs ctx) 1000)]
