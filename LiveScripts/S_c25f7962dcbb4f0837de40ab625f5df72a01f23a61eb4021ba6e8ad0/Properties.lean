import CardanoLedgerApi.V2
import LiveScripts.S_c25f7962dcbb4f0837de40ab625f5df72a01f23a61eb4021ba6e8ad0.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c25f7962dcbb4f0837de40ab625f5df72a01f23a61eb4021ba6e8ad0.script (spendingInputs input) 1000)]
