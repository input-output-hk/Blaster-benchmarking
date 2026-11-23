import CardanoLedgerApi.V3
import LiveScripts.S_4cda611fd5c9880b2f20c18b1ce0a500441e8ae91d6fe48678ec467c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4cda611fd5c9880b2f20c18b1ce0a500441e8ae91d6fe48678ec467c.script (spendingInputs ctx) 1000)]
