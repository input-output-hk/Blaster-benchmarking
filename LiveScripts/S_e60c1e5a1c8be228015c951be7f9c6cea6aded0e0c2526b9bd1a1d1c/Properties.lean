import CardanoLedgerApi.V3
import LiveScripts.S_e60c1e5a1c8be228015c951be7f9c6cea6aded0e0c2526b9bd1a1d1c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e60c1e5a1c8be228015c951be7f9c6cea6aded0e0c2526b9bd1a1d1c.script (mintingInputs ctx) 1000)]
