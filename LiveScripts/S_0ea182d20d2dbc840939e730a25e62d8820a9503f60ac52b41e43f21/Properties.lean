import CardanoLedgerApi.V3
import LiveScripts.S_0ea182d20d2dbc840939e730a25e62d8820a9503f60ac52b41e43f21.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0ea182d20d2dbc840939e730a25e62d8820a9503f60ac52b41e43f21.script (spendingInputs ctx) 1000)]
