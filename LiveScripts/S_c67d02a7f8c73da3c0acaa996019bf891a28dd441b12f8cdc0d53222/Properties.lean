import CardanoLedgerApi.V2
import LiveScripts.S_c67d02a7f8c73da3c0acaa996019bf891a28dd441b12f8cdc0d53222.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c67d02a7f8c73da3c0acaa996019bf891a28dd441b12f8cdc0d53222.script (spendingInputs input) 1000)]
