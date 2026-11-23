import CardanoLedgerApi.V2
import LiveScripts.S_cb684a69e78907a9796b21fc150a758af5f2805e5ed5d5a8ce9f76f1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_cb684a69e78907a9796b21fc150a758af5f2805e5ed5d5a8ce9f76f1.script (spendingInputs input) 1000)]
