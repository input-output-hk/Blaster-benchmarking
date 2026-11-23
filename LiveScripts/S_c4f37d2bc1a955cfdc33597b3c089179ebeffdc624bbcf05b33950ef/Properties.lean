import CardanoLedgerApi.V3
import LiveScripts.S_c4f37d2bc1a955cfdc33597b3c089179ebeffdc624bbcf05b33950ef.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c4f37d2bc1a955cfdc33597b3c089179ebeffdc624bbcf05b33950ef.script (spendingInputs ctx) 1000)]
