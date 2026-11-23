import CardanoLedgerApi.V3
import LiveScripts.S_5781eaa356966b46ef9a37928791b61c7815e1c027ecdd3b5ba9a68a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5781eaa356966b46ef9a37928791b61c7815e1c027ecdd3b5ba9a68a.script (spendingInputs ctx) 1000)]
