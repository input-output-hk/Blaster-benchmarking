import CardanoLedgerApi.V3
import LiveScripts.S_15217aa12f7d8a9714f38c49c813707bb91c20e3b68c3b9df3d54ee0.Script
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
      ¬ isSuccessful (cekExecuteProgram script_15217aa12f7d8a9714f38c49c813707bb91c20e3b68c3b9df3d54ee0.script (spendingInputs ctx) 1000)]
