import CardanoLedgerApi.V3
import LiveScripts.S_8b200843eb2618cbdfdf2acbe4a49b6d608107006ec63106f08ba12b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8b200843eb2618cbdfdf2acbe4a49b6d608107006ec63106f08ba12b.script (spendingInputs ctx) 1000)]
