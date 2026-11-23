import CardanoLedgerApi.V1
import LiveScripts.S_cdd31e84650c9d31a0751c595b3e7aa5e8ccd14c6f34d1efda8c83fa.Script
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
      ¬ isSuccessful (cekExecuteProgram script_cdd31e84650c9d31a0751c595b3e7aa5e8ccd14c6f34d1efda8c83fa.script (spendingInputs input) 1000)]
