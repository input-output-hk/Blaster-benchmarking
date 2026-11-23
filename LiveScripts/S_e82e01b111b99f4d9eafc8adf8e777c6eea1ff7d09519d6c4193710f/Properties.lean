import CardanoLedgerApi.V3
import LiveScripts.S_e82e01b111b99f4d9eafc8adf8e777c6eea1ff7d09519d6c4193710f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e82e01b111b99f4d9eafc8adf8e777c6eea1ff7d09519d6c4193710f.script (spendingInputs ctx) 1000)]
