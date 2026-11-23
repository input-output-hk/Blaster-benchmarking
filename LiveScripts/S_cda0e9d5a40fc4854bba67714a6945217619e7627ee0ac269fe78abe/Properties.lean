import CardanoLedgerApi.V2
import LiveScripts.S_cda0e9d5a40fc4854bba67714a6945217619e7627ee0ac269fe78abe.Script
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
      ¬ isSuccessful (cekExecuteProgram script_cda0e9d5a40fc4854bba67714a6945217619e7627ee0ac269fe78abe.script (spendingInputs input) 1000)]
