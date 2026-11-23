import CardanoLedgerApi.V3
import LiveScripts.S_21957378c2571c3079c08d586d9ef710bb95c69bc7f5fd2add5b5ca9.Script
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
      ¬ isSuccessful (cekExecuteProgram script_21957378c2571c3079c08d586d9ef710bb95c69bc7f5fd2add5b5ca9.script (mintingInputs ctx) 1000)]
