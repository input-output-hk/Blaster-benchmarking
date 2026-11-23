import CardanoLedgerApi.V2
import LiveScripts.S_46cec3ff9f7c351bc85a36e86738333fa1b1d1a2afb15c2c62ebd4af.Script
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
      ¬ isSuccessful (cekExecuteProgram script_46cec3ff9f7c351bc85a36e86738333fa1b1d1a2afb15c2c62ebd4af.script (spendingInputs input) 1000)]
