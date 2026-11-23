import CardanoLedgerApi.V2
import LiveScripts.S_fa3603d2283e3dadee0b5810faf590ea9da6c7fea91095657f98a9c2.Script
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
      ¬ isSuccessful (cekExecuteProgram script_fa3603d2283e3dadee0b5810faf590ea9da6c7fea91095657f98a9c2.script (spendingInputs input) 1000)]
