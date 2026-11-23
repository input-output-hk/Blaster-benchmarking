import CardanoLedgerApi.V3
import LiveScripts.S_467b76743bb4ec55c83e297144a1daf3e252f5701f359d71c20ac4fd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_467b76743bb4ec55c83e297144a1daf3e252f5701f359d71c20ac4fd.script (spendingInputs ctx) 1000)]
