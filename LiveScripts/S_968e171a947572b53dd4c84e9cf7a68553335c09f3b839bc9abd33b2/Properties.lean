import CardanoLedgerApi.V3
import LiveScripts.S_968e171a947572b53dd4c84e9cf7a68553335c09f3b839bc9abd33b2.Script
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
      ¬ isSuccessful (cekExecuteProgram script_968e171a947572b53dd4c84e9cf7a68553335c09f3b839bc9abd33b2.script (spendingInputs ctx) 1000)]
