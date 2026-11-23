import CardanoLedgerApi.V3
import LiveScripts.S_c15f931e40ee83bc2e3a802a3fd8c8d11d8591fab51ed66da60d34be.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c15f931e40ee83bc2e3a802a3fd8c8d11d8591fab51ed66da60d34be.script (spendingInputs ctx) 1000)]
