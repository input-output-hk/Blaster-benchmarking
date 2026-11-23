import CardanoLedgerApi.V2
import LiveScripts.S_b0ebdd68bd00f3a633c5097fe0243d69fb27abacd7f6959bec63c4c4.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b0ebdd68bd00f3a633c5097fe0243d69fb27abacd7f6959bec63c4c4.script (spendingInputs input) 1000)]
