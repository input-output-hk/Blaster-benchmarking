import CardanoLedgerApi.V3
import LiveScripts.S_ee16a715923884d8d7588b1fe919d65bf60c085f898f5ba6220f6f53.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ee16a715923884d8d7588b1fe919d65bf60c085f898f5ba6220f6f53.script (spendingInputs ctx) 1000)]
