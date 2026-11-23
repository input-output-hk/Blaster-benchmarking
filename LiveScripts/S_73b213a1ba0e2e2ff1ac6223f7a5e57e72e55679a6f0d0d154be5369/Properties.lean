import CardanoLedgerApi.V3
import LiveScripts.S_73b213a1ba0e2e2ff1ac6223f7a5e57e72e55679a6f0d0d154be5369.Script
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
      ¬ isSuccessful (cekExecuteProgram script_73b213a1ba0e2e2ff1ac6223f7a5e57e72e55679a6f0d0d154be5369.script (spendingInputs ctx) 1000)]
