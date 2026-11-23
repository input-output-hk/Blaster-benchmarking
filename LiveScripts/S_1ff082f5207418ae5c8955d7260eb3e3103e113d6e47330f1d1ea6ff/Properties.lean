import CardanoLedgerApi.V3
import LiveScripts.S_1ff082f5207418ae5c8955d7260eb3e3103e113d6e47330f1d1ea6ff.Script
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
      ¬ isSuccessful (cekExecuteProgram script_1ff082f5207418ae5c8955d7260eb3e3103e113d6e47330f1d1ea6ff.script (spendingInputs ctx) 1000)]
