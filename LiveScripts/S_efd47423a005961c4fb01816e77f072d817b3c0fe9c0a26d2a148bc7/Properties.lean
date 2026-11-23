import CardanoLedgerApi.V1
import LiveScripts.S_efd47423a005961c4fb01816e77f072d817b3c0fe9c0a26d2a148bc7.Script
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
      ¬ isSuccessful (cekExecuteProgram script_efd47423a005961c4fb01816e77f072d817b3c0fe9c0a26d2a148bc7.script (spendingInputs input) 1000)]
