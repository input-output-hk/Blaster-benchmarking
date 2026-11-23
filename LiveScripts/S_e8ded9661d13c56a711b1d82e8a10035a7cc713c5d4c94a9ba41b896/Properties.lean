import CardanoLedgerApi.V2
import LiveScripts.S_e8ded9661d13c56a711b1d82e8a10035a7cc713c5d4c94a9ba41b896.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e8ded9661d13c56a711b1d82e8a10035a7cc713c5d4c94a9ba41b896.script (spendingInputs input) 1000)]
