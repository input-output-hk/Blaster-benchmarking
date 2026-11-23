import CardanoLedgerApi.V2
import LiveScripts.S_afae293f6a7de61f8b3faf28e4309ba8072da9d7acd1d293787cef0f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_afae293f6a7de61f8b3faf28e4309ba8072da9d7acd1d293787cef0f.script (spendingInputs input) 1000)]
