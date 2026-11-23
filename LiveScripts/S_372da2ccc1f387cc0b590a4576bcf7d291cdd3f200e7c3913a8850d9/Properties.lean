import CardanoLedgerApi.V3
import LiveScripts.S_372da2ccc1f387cc0b590a4576bcf7d291cdd3f200e7c3913a8850d9.Script
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
      ¬ isSuccessful (cekExecuteProgram script_372da2ccc1f387cc0b590a4576bcf7d291cdd3f200e7c3913a8850d9.script (spendingInputs ctx) 1000)]
