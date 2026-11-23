import CardanoLedgerApi.V3
import LiveScripts.S_b5342b1d824d4bcef377ee4fadc54288240be5b9db0ef03240e48ff9.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b5342b1d824d4bcef377ee4fadc54288240be5b9db0ef03240e48ff9.script (mintingInputs ctx) 1000)]
