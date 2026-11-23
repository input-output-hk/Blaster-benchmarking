import CardanoLedgerApi.V3
import LiveScripts.S_e8bdec96b0f1d0b55f16728841029c42eb52228aee621e0f5c8a148d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e8bdec96b0f1d0b55f16728841029c42eb52228aee621e0f5c8a148d.script (spendingInputs ctx) 1000)]
