import CardanoLedgerApi.V2
import LiveScripts.S_d6ba9b7509eac866288ff5072d2a18205ac56f744bc82dcd808cb8fe.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d6ba9b7509eac866288ff5072d2a18205ac56f744bc82dcd808cb8fe.script (spendingInputs input) 1000)]
