import CardanoLedgerApi.V3
import LiveScripts.S_a8dad0b6e4a24b4ba2c867a21a959b47cbe30f9f0695ad67f0e01054.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a8dad0b6e4a24b4ba2c867a21a959b47cbe30f9f0695ad67f0e01054.script (spendingInputs ctx) 1000)]
