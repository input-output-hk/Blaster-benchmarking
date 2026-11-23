import CardanoLedgerApi.V3
import LiveScripts.S_219ad85cb7cb300f3d315e5b8469de05ae79e8135c318d1d0d0de690.Script
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
      ¬ isSuccessful (cekExecuteProgram script_219ad85cb7cb300f3d315e5b8469de05ae79e8135c318d1d0d0de690.script (spendingInputs ctx) 1000)]
