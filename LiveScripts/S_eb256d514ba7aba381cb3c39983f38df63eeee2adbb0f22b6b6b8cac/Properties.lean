import CardanoLedgerApi.V2
import LiveScripts.S_eb256d514ba7aba381cb3c39983f38df63eeee2adbb0f22b6b6b8cac.Script
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
      ¬ isSuccessful (cekExecuteProgram script_eb256d514ba7aba381cb3c39983f38df63eeee2adbb0f22b6b6b8cac.script (spendingInputs input) 1000)]
