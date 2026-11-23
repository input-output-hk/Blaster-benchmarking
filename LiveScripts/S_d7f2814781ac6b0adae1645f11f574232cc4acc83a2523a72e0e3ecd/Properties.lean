import CardanoLedgerApi.V3
import LiveScripts.S_d7f2814781ac6b0adae1645f11f574232cc4acc83a2523a72e0e3ecd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d7f2814781ac6b0adae1645f11f574232cc4acc83a2523a72e0e3ecd.script (spendingInputs ctx) 1000)]
