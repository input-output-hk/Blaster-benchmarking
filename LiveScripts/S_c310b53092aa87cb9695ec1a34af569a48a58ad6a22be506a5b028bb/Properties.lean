import CardanoLedgerApi.V1
import LiveScripts.S_c310b53092aa87cb9695ec1a34af569a48a58ad6a22be506a5b028bb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c310b53092aa87cb9695ec1a34af569a48a58ad6a22be506a5b028bb.script (spendingInputs input) 1000)]
