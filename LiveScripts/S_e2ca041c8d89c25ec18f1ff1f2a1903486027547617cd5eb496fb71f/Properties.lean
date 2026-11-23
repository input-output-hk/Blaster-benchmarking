import CardanoLedgerApi.V2
import LiveScripts.S_e2ca041c8d89c25ec18f1ff1f2a1903486027547617cd5eb496fb71f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e2ca041c8d89c25ec18f1ff1f2a1903486027547617cd5eb496fb71f.script (spendingInputs input) 1000)]
