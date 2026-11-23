import CardanoLedgerApi.V3
import LiveScripts.S_3c212bf999c50552a513ff1b0d77045ea9a437c45e30f3bfbac72674.Script
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
      ¬ isSuccessful (cekExecuteProgram script_3c212bf999c50552a513ff1b0d77045ea9a437c45e30f3bfbac72674.script (mintingInputs ctx) 1000)]
