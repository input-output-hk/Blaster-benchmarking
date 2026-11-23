import CardanoLedgerApi.V2
import LiveScripts.S_b80ac637b92af8d0a8bb366e9cbd153ca3ebfdb7d1d209a7c0a75b34.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b80ac637b92af8d0a8bb366e9cbd153ca3ebfdb7d1d209a7c0a75b34.script (spendingInputs input) 1000)]
