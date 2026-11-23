import CardanoLedgerApi.V2
import LiveScripts.S_c0b2a5a9e2aa4b203d4ae80b04406142245220d7a430cf7c3dc340aa.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c0b2a5a9e2aa4b203d4ae80b04406142245220d7a430cf7c3dc340aa.script (spendingInputs input) 1000)]
