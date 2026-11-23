import CardanoLedgerApi.V2
import LiveScripts.S_b70c71824a52bf79cc35239c68d57f8e944642f97ae59ed89f2cb8a1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b70c71824a52bf79cc35239c68d57f8e944642f97ae59ed89f2cb8a1.script (spendingInputs input) 1000)]
