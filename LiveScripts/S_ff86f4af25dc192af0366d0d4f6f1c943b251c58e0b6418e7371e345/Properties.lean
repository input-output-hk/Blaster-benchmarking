import CardanoLedgerApi.V3
import LiveScripts.S_ff86f4af25dc192af0366d0d4f6f1c943b251c58e0b6418e7371e345.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ff86f4af25dc192af0366d0d4f6f1c943b251c58e0b6418e7371e345.script (spendingInputs ctx) 1000)]
