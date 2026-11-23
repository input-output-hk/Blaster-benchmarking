import CardanoLedgerApi.V3
import LiveScripts.S_a1bfefcf5e6ad9094d7bfffde55d3b42efa7739f19ea9fd2f5b42a0f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a1bfefcf5e6ad9094d7bfffde55d3b42efa7739f19ea9fd2f5b42a0f.script (mintingInputs ctx) 1000)]
