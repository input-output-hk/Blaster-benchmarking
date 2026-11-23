import CardanoLedgerApi.V3
import LiveScripts.S_4479fc6d9dcca2a14377275ef386f97df91e85026c15a3332ea1cb17.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4479fc6d9dcca2a14377275ef386f97df91e85026c15a3332ea1cb17.script (spendingInputs ctx) 1000)]
