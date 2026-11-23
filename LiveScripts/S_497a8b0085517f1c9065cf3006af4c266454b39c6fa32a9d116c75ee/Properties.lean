import CardanoLedgerApi.V3
import LiveScripts.S_497a8b0085517f1c9065cf3006af4c266454b39c6fa32a9d116c75ee.Script
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
      ¬ isSuccessful (cekExecuteProgram script_497a8b0085517f1c9065cf3006af4c266454b39c6fa32a9d116c75ee.script (spendingInputs ctx) 1000)]
