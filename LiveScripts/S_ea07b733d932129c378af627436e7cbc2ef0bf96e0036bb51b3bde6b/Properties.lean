import CardanoLedgerApi.V2
import LiveScripts.S_ea07b733d932129c378af627436e7cbc2ef0bf96e0036bb51b3bde6b.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V2
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: spend; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ input : SpendingInput,
    validSpendingContext input →
      ¬ isSuccessful (cekExecuteProgram script_ea07b733d932129c378af627436e7cbc2ef0bf96e0036bb51b3bde6b.script (spendingInputs input) 1000)]
