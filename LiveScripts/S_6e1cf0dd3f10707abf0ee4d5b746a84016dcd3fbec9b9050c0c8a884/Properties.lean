import CardanoLedgerApi.V3
import LiveScripts.S_6e1cf0dd3f10707abf0ee4d5b746a84016dcd3fbec9b9050c0c8a884.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: spend; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validSpendingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_6e1cf0dd3f10707abf0ee4d5b746a84016dcd3fbec9b9050c0c8a884.script (spendingInputs ctx) 1000)]
