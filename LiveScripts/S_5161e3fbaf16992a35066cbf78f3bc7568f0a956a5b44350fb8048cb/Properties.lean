import CardanoLedgerApi.V3
import LiveScripts.S_5161e3fbaf16992a35066cbf78f3bc7568f0a956a5b44350fb8048cb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5161e3fbaf16992a35066cbf78f3bc7568f0a956a5b44350fb8048cb.script (mintingInputs ctx) 1000)]
