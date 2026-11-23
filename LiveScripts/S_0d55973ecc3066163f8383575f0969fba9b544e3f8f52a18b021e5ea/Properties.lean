import CardanoLedgerApi.V3
import LiveScripts.S_0d55973ecc3066163f8383575f0969fba9b544e3f8f52a18b021e5ea.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0d55973ecc3066163f8383575f0969fba9b544e3f8f52a18b021e5ea.script (spendingInputs ctx) 1000)]
