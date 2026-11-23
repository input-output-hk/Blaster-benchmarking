import CardanoLedgerApi.V3
import LiveScripts.S_205bce88e2616c5036ebdb3a78550fd99e7fc8e7f86e09e783033aff.Script
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
      ¬ isSuccessful (cekExecuteProgram script_205bce88e2616c5036ebdb3a78550fd99e7fc8e7f86e09e783033aff.script (mintingInputs ctx) 1000)]
