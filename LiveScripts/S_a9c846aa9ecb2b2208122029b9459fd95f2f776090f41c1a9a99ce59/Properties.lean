import CardanoLedgerApi.V2
import LiveScripts.S_a9c846aa9ecb2b2208122029b9459fd95f2f776090f41c1a9a99ce59.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a9c846aa9ecb2b2208122029b9459fd95f2f776090f41c1a9a99ce59.script (spendingInputs input) 1000)]
