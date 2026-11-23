import CardanoLedgerApi.V3
import LiveScripts.S_f83cc115cc6799736b67a05dec8d99c002bee59a840d07e6d4a8c161.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f83cc115cc6799736b67a05dec8d99c002bee59a840d07e6d4a8c161.script (mintingInputs ctx) 1000)]
