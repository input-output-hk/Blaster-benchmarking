import CardanoLedgerApi.V3
import LiveScripts.S_cd2c8be483b7b7b812cd44a145ca41a6e2d3ade21f8a85bbd453ce2b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_cd2c8be483b7b7b812cd44a145ca41a6e2d3ade21f8a85bbd453ce2b.script (mintingInputs ctx) 1000)]
