import CardanoLedgerApi.V2
import LiveScripts.S_6b9c456aa650cb808a9ab54326e039d5235ed69f069c9664a8fe5b69.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6b9c456aa650cb808a9ab54326e039d5235ed69f069c9664a8fe5b69.script (spendingInputs input) 1000)]
