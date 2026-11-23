import CardanoLedgerApi.V3
import LiveScripts.S_46a8fe69bbcdd714025ed790432544ee620ce6e35d5f5cb40b5be213.Script
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
      ¬ isSuccessful (cekExecuteProgram script_46a8fe69bbcdd714025ed790432544ee620ce6e35d5f5cb40b5be213.script (mintingInputs ctx) 1000)]
