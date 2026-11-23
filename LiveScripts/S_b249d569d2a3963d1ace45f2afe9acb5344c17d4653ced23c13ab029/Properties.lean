import CardanoLedgerApi.V1
import LiveScripts.S_b249d569d2a3963d1ace45f2afe9acb5344c17d4653ced23c13ab029.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V1
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: spend; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ input : SpendingInput,
    validSpendingContext input →
      ¬ isSuccessful (cekExecuteProgram script_b249d569d2a3963d1ace45f2afe9acb5344c17d4653ced23c13ab029.script (spendingInputs input) 1000)]
