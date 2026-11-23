import CardanoLedgerApi.V1
import LiveScripts.S_21ace3a843a7a2ffdc5b54a1145a1439444ad1a520bc85cc2698a91d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_21ace3a843a7a2ffdc5b54a1145a1439444ad1a520bc85cc2698a91d.script (spendingInputs input) 1000)]
