import CardanoLedgerApi.V3
import LiveScripts.S_15c964b8c763ee1a9cd0159a3e490404fd5b4fe1ef6ff88f6b45a7ed.Script
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
      ¬ isSuccessful (cekExecuteProgram script_15c964b8c763ee1a9cd0159a3e490404fd5b4fe1ef6ff88f6b45a7ed.script (spendingInputs ctx) 1000)]
