import CardanoLedgerApi.V3
import LiveScripts.S_b23d5f5dc71cb2994f390d3fdfc612d0401bc17384e6153165d6a5c7.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b23d5f5dc71cb2994f390d3fdfc612d0401bc17384e6153165d6a5c7.script (spendingInputs ctx) 1000)]
