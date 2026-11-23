import CardanoLedgerApi.V3
import LiveScripts.S_39cfc70edd7264d12640adcca762cee4c4b50d8ffd4b504974f0c9aa.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: mint; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validMintingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_39cfc70edd7264d12640adcca762cee4c4b50d8ffd4b504974f0c9aa.script (mintingInputs ctx) 1000)]
