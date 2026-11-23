import CardanoLedgerApi.V3
import LiveScripts.S_c1b47001fbd36f891f5f038c8e2de77492a79d0a48d51d2faefe3baa.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c1b47001fbd36f891f5f038c8e2de77492a79d0a48d51d2faefe3baa.script (spendingInputs ctx) 1000)]
