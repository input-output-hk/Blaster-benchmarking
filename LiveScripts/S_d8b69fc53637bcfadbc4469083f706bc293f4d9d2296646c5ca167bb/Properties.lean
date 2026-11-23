import CardanoLedgerApi.V3
import LiveScripts.S_d8b69fc53637bcfadbc4469083f706bc293f4d9d2296646c5ca167bb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d8b69fc53637bcfadbc4469083f706bc293f4d9d2296646c5ca167bb.script (spendingInputs ctx) 1000)]
