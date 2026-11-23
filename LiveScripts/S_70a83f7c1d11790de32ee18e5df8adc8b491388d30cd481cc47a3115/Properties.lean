import CardanoLedgerApi.V3
import LiveScripts.S_70a83f7c1d11790de32ee18e5df8adc8b491388d30cd481cc47a3115.Script
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
      ¬ isSuccessful (cekExecuteProgram script_70a83f7c1d11790de32ee18e5df8adc8b491388d30cd481cc47a3115.script (spendingInputs ctx) 1000)]
