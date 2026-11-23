import CardanoLedgerApi.V3
import LiveScripts.S_fefbb3c68a89df0b54389dcf364e7f9fedb4e88f3699f0cff9da9bb1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_fefbb3c68a89df0b54389dcf364e7f9fedb4e88f3699f0cff9da9bb1.script (mintingInputs ctx) 1000)]
