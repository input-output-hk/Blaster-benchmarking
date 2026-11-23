import CardanoLedgerApi.V2
import LiveScripts.S_0f4b3c952d093e40448124665efb7e8c1a35b4130f97fbb012bb74ed.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0f4b3c952d093e40448124665efb7e8c1a35b4130f97fbb012bb74ed.script (spendingInputs input) 1000)]
