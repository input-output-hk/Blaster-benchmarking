import CardanoLedgerApi.V3
import LiveScripts.S_3adaa181f59dc217b3cc6359fd26e9e0d64f9507e7e64c1acbdb64a9.Script
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
      ¬ isSuccessful (cekExecuteProgram script_3adaa181f59dc217b3cc6359fd26e9e0d64f9507e7e64c1acbdb64a9.script (mintingInputs ctx) 1000)]
