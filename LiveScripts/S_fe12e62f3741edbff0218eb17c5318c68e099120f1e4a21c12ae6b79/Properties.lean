import CardanoLedgerApi.V3
import LiveScripts.S_fe12e62f3741edbff0218eb17c5318c68e099120f1e4a21c12ae6b79.Script
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
      ¬ isSuccessful (cekExecuteProgram script_fe12e62f3741edbff0218eb17c5318c68e099120f1e4a21c12ae6b79.script (spendingInputs ctx) 1000)]
