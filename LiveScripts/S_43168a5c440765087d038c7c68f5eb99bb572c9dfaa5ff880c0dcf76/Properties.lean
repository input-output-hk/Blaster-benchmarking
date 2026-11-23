import CardanoLedgerApi.V2
import LiveScripts.S_43168a5c440765087d038c7c68f5eb99bb572c9dfaa5ff880c0dcf76.Script
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
      ¬ isSuccessful (cekExecuteProgram script_43168a5c440765087d038c7c68f5eb99bb572c9dfaa5ff880c0dcf76.script (spendingInputs input) 1000)]
