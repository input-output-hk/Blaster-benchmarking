import CardanoLedgerApi.V3
import LiveScripts.S_ac9ea997441021e53ae8a2cdf78372087c180b5f511b2a40b6a9dbd2.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ac9ea997441021e53ae8a2cdf78372087c180b5f511b2a40b6a9dbd2.script (mintingInputs ctx) 1000)]
