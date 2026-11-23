import CardanoLedgerApi.V2
import LiveScripts.S_075e09eb0fa89e1dc34691b3c56a7f437e60ac5ea67b338f2e176e20.Script
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
      ¬ isSuccessful (cekExecuteProgram script_075e09eb0fa89e1dc34691b3c56a7f437e60ac5ea67b338f2e176e20.script (spendingInputs input) 1000)]
