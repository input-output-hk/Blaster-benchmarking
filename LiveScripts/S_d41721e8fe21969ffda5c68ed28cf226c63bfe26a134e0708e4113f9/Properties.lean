import CardanoLedgerApi.V3
import LiveScripts.S_d41721e8fe21969ffda5c68ed28cf226c63bfe26a134e0708e4113f9.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d41721e8fe21969ffda5c68ed28cf226c63bfe26a134e0708e4113f9.script (mintingInputs ctx) 1000)]
