import CardanoLedgerApi.V2
import LiveScripts.S_bc3de5c5af5513959c205dbefbdcf81505a4c59d16ec2471c5e856c0.Script
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
      ¬ isSuccessful (cekExecuteProgram script_bc3de5c5af5513959c205dbefbdcf81505a4c59d16ec2471c5e856c0.script (spendingInputs input) 1000)]
