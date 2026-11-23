import CardanoLedgerApi.V1
import LiveScripts.S_bd74211843c2ea0bb3dd3fe2ec3ee22dcb2f69d3cf6ff7393231b8bf.Script
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
      ¬ isSuccessful (cekExecuteProgram script_bd74211843c2ea0bb3dd3fe2ec3ee22dcb2f69d3cf6ff7393231b8bf.script (spendingInputs input) 1000)]
