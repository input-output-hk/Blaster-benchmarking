import CardanoLedgerApi.V3
import LiveScripts.S_4612bbafbe69786e08904c09285ea5f7623a1c17dbf4c4d3b4286895.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4612bbafbe69786e08904c09285ea5f7623a1c17dbf4c4d3b4286895.script (spendingInputs ctx) 1000)]
