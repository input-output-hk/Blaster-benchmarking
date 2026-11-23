import CardanoLedgerApi.V3
import LiveScripts.S_5bea2a7c5e67c8b514ba9692213f9231b5470c1bab656faedf887bfd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5bea2a7c5e67c8b514ba9692213f9231b5470c1bab656faedf887bfd.script (spendingInputs ctx) 1000)]
