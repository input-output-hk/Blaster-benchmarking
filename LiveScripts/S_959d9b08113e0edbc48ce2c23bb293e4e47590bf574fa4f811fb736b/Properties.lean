import CardanoLedgerApi.V2
import LiveScripts.S_959d9b08113e0edbc48ce2c23bb293e4e47590bf574fa4f811fb736b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_959d9b08113e0edbc48ce2c23bb293e4e47590bf574fa4f811fb736b.script (spendingInputs input) 1000)]
