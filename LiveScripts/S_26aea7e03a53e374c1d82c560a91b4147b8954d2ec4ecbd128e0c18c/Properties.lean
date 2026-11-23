import CardanoLedgerApi.V2
import LiveScripts.S_26aea7e03a53e374c1d82c560a91b4147b8954d2ec4ecbd128e0c18c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_26aea7e03a53e374c1d82c560a91b4147b8954d2ec4ecbd128e0c18c.script (spendingInputs input) 1000)]
