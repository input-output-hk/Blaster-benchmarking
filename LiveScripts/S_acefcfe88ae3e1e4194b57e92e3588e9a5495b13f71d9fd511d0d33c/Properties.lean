import CardanoLedgerApi.V2
import LiveScripts.S_acefcfe88ae3e1e4194b57e92e3588e9a5495b13f71d9fd511d0d33c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_acefcfe88ae3e1e4194b57e92e3588e9a5495b13f71d9fd511d0d33c.script (spendingInputs input) 1000)]
