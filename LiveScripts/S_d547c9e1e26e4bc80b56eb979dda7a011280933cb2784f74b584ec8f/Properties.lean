import CardanoLedgerApi.V3
import LiveScripts.S_d547c9e1e26e4bc80b56eb979dda7a011280933cb2784f74b584ec8f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d547c9e1e26e4bc80b56eb979dda7a011280933cb2784f74b584ec8f.script (spendingInputs ctx) 1000)]
