import CardanoLedgerApi.V3
import LiveScripts.S_10eb0642ee5d4746d0ccff8c36b24550af1010245b1b3c5a55fe471f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_10eb0642ee5d4746d0ccff8c36b24550af1010245b1b3c5a55fe471f.script (spendingInputs ctx) 1000)]
