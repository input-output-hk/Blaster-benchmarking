import CardanoLedgerApi.V3
import LiveScripts.S_8ed8a1247660c8d22c1177ff997fb017ef5b2e29b23cc84016d1a0c0.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8ed8a1247660c8d22c1177ff997fb017ef5b2e29b23cc84016d1a0c0.script (spendingInputs ctx) 1000)]
