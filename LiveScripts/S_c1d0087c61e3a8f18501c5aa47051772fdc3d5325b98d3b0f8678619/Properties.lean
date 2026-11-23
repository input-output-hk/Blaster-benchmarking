import CardanoLedgerApi.V1
import LiveScripts.S_c1d0087c61e3a8f18501c5aa47051772fdc3d5325b98d3b0f8678619.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c1d0087c61e3a8f18501c5aa47051772fdc3d5325b98d3b0f8678619.script (spendingInputs input) 1000)]
