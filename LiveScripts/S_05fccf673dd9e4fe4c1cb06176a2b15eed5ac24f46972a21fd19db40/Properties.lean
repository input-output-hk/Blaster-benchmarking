import CardanoLedgerApi.V3
import LiveScripts.S_05fccf673dd9e4fe4c1cb06176a2b15eed5ac24f46972a21fd19db40.Script
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
      ¬ isSuccessful (cekExecuteProgram script_05fccf673dd9e4fe4c1cb06176a2b15eed5ac24f46972a21fd19db40.script (spendingInputs ctx) 1000)]
