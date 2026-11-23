import CardanoLedgerApi.V2
import LiveScripts.S_e628bfd68c07a7a38fcd7d8df650812a9dfdbee54b1ed4c25c87ffbf.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e628bfd68c07a7a38fcd7d8df650812a9dfdbee54b1ed4c25c87ffbf.script (spendingInputs input) 1000)]
