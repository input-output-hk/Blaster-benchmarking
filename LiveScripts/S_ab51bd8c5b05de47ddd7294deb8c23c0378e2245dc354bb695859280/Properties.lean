import CardanoLedgerApi.V3
import LiveScripts.S_ab51bd8c5b05de47ddd7294deb8c23c0378e2245dc354bb695859280.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ab51bd8c5b05de47ddd7294deb8c23c0378e2245dc354bb695859280.script (mintingInputs ctx) 1000)]
