import CardanoLedgerApi.V3
import LiveScripts.S_f5c26f11fda89c9773d24f5abeb1aae6eb4a5bd7a6c750a1f464a08f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f5c26f11fda89c9773d24f5abeb1aae6eb4a5bd7a6c750a1f464a08f.script (spendingInputs ctx) 1000)]
