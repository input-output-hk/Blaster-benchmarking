import CardanoLedgerApi.V3
import LiveScripts.S_89fa3a3ae3ce6b057eb307db464df2ce733efbcdf8a17b0354c124c6.Script
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
      ¬ isSuccessful (cekExecuteProgram script_89fa3a3ae3ce6b057eb307db464df2ce733efbcdf8a17b0354c124c6.script (mintingInputs ctx) 1000)]
