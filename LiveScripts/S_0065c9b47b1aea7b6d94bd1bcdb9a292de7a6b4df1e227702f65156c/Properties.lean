import CardanoLedgerApi.V3
import LiveScripts.S_0065c9b47b1aea7b6d94bd1bcdb9a292de7a6b4df1e227702f65156c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0065c9b47b1aea7b6d94bd1bcdb9a292de7a6b4df1e227702f65156c.script (spendingInputs ctx) 1000)]
