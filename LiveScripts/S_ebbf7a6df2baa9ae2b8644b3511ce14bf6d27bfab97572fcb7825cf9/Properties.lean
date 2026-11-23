import CardanoLedgerApi.V3
import LiveScripts.S_ebbf7a6df2baa9ae2b8644b3511ce14bf6d27bfab97572fcb7825cf9.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ebbf7a6df2baa9ae2b8644b3511ce14bf6d27bfab97572fcb7825cf9.script (spendingInputs ctx) 1000)]
