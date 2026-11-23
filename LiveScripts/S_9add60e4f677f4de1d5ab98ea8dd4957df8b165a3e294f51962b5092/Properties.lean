import CardanoLedgerApi.V2
import LiveScripts.S_9add60e4f677f4de1d5ab98ea8dd4957df8b165a3e294f51962b5092.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9add60e4f677f4de1d5ab98ea8dd4957df8b165a3e294f51962b5092.script (spendingInputs input) 1000)]
