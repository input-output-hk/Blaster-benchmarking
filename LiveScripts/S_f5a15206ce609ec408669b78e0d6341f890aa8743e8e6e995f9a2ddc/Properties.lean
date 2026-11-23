import CardanoLedgerApi.V3
import LiveScripts.S_f5a15206ce609ec408669b78e0d6341f890aa8743e8e6e995f9a2ddc.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f5a15206ce609ec408669b78e0d6341f890aa8743e8e6e995f9a2ddc.script (spendingInputs ctx) 1000)]
