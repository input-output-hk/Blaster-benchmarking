import CardanoLedgerApi.V2
import LiveScripts.S_71b00bb6a54422cad7de4e784ced3a1aa9cd2974303f89d026b8756c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_71b00bb6a54422cad7de4e784ced3a1aa9cd2974303f89d026b8756c.script (spendingInputs input) 1000)]
