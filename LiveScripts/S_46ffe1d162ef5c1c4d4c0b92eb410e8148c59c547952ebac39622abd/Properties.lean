import CardanoLedgerApi.V3
import LiveScripts.S_46ffe1d162ef5c1c4d4c0b92eb410e8148c59c547952ebac39622abd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_46ffe1d162ef5c1c4d4c0b92eb410e8148c59c547952ebac39622abd.script (spendingInputs ctx) 1000)]
