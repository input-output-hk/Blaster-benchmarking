import CardanoLedgerApi.V1
import LiveScripts.S_32ca7fe53af53ad1322e308dcf02172954721dc3ce07a0e9fa6f942f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_32ca7fe53af53ad1322e308dcf02172954721dc3ce07a0e9fa6f942f.script (spendingInputs input) 1000)]
