import CardanoLedgerApi.V3
import LiveScripts.S_186e32faa80a26810392fda6d559c7ed4721a65ce1c9d4ef3e1c87b4.Script
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
      ¬ isSuccessful (cekExecuteProgram script_186e32faa80a26810392fda6d559c7ed4721a65ce1c9d4ef3e1c87b4.script (spendingInputs ctx) 1000)]
