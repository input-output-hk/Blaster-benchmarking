import CardanoLedgerApi.V2
import LiveScripts.S_4e184586ce5d62d46e0d1ab3305f1d7b811278f1c27eecbf2baacc4d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4e184586ce5d62d46e0d1ab3305f1d7b811278f1c27eecbf2baacc4d.script (spendingInputs input) 1000)]
