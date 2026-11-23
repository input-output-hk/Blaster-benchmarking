import CardanoLedgerApi.V3
import LiveScripts.S_42861299bf268653db3ef59b4e4dc175f1fdbc6a97d72f224407e81c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_42861299bf268653db3ef59b4e4dc175f1fdbc6a97d72f224407e81c.script (spendingInputs ctx) 1000)]
