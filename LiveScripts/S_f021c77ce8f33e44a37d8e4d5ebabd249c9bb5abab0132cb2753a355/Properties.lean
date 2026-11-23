import CardanoLedgerApi.V3
import LiveScripts.S_f021c77ce8f33e44a37d8e4d5ebabd249c9bb5abab0132cb2753a355.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f021c77ce8f33e44a37d8e4d5ebabd249c9bb5abab0132cb2753a355.script (mintingInputs ctx) 1000)]
