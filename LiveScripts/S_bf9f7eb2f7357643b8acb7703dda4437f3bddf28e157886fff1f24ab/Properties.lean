import CardanoLedgerApi.V3
import LiveScripts.S_bf9f7eb2f7357643b8acb7703dda4437f3bddf28e157886fff1f24ab.Script
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
      ¬ isSuccessful (cekExecuteProgram script_bf9f7eb2f7357643b8acb7703dda4437f3bddf28e157886fff1f24ab.script (spendingInputs ctx) 1000)]
