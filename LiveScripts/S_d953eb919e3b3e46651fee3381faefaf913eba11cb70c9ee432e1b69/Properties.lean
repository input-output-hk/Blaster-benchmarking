import CardanoLedgerApi.V2
import LiveScripts.S_d953eb919e3b3e46651fee3381faefaf913eba11cb70c9ee432e1b69.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d953eb919e3b3e46651fee3381faefaf913eba11cb70c9ee432e1b69.script (spendingInputs input) 1000)]
