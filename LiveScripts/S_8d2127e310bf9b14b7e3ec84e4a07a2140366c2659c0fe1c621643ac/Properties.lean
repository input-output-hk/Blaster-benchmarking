import CardanoLedgerApi.V3
import LiveScripts.S_8d2127e310bf9b14b7e3ec84e4a07a2140366c2659c0fe1c621643ac.Script
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
      ¬ isSuccessful (cekExecuteProgram script_8d2127e310bf9b14b7e3ec84e4a07a2140366c2659c0fe1c621643ac.script (spendingInputs ctx) 1000)]
