import CardanoLedgerApi.V2
import LiveScripts.S_07de5eb4fdb9f6bd23c7bc3c588306f03d46c8c59ee980223132c87e.Script
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
      ¬ isSuccessful (cekExecuteProgram script_07de5eb4fdb9f6bd23c7bc3c588306f03d46c8c59ee980223132c87e.script (spendingInputs input) 1000)]
