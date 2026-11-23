import CardanoLedgerApi.V1
import LiveScripts.S_ba158766c1bae60e2117ee8987621441fac66a5e0fb9c7aca58cf20a.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V1
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: spend; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ input : SpendingInput,
    validSpendingContext input →
      ¬ isSuccessful (cekExecuteProgram script_ba158766c1bae60e2117ee8987621441fac66a5e0fb9c7aca58cf20a.script (spendingInputs input) 1000)]
