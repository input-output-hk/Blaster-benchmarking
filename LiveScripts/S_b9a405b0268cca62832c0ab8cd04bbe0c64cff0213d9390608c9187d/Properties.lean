import CardanoLedgerApi.V3
import LiveScripts.S_b9a405b0268cca62832c0ab8cd04bbe0c64cff0213d9390608c9187d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b9a405b0268cca62832c0ab8cd04bbe0c64cff0213d9390608c9187d.script (spendingInputs ctx) 1000)]
