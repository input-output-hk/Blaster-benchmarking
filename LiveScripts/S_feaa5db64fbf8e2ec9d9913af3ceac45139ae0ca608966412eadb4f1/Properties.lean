import CardanoLedgerApi.V2
import LiveScripts.S_feaa5db64fbf8e2ec9d9913af3ceac45139ae0ca608966412eadb4f1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_feaa5db64fbf8e2ec9d9913af3ceac45139ae0ca608966412eadb4f1.script (spendingInputs input) 1000)]
