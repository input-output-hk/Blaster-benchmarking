import CardanoLedgerApi.V3
import LiveScripts.S_6206b04cc30653c86889fe64e4c9eb210c70ff2a45641551e70daca9.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6206b04cc30653c86889fe64e4c9eb210c70ff2a45641551e70daca9.script (mintingInputs ctx) 1000)]
