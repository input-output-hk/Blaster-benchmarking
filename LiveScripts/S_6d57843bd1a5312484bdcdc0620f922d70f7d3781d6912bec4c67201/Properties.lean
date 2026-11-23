import CardanoLedgerApi.V3
import LiveScripts.S_6d57843bd1a5312484bdcdc0620f922d70f7d3781d6912bec4c67201.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6d57843bd1a5312484bdcdc0620f922d70f7d3781d6912bec4c67201.script (mintingInputs ctx) 1000)]
