import CardanoLedgerApi.V1
import LiveScripts.S_ec2a6456e28d03e81087c54493c9b42d1a4051e4b837bab77514ee97.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ec2a6456e28d03e81087c54493c9b42d1a4051e4b837bab77514ee97.script (spendingInputs input) 1000)]
