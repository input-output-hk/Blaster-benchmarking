import CardanoLedgerApi.V3
import LiveScripts.S_7d9e4a0ee1a3f5d5ff8159ea91a83310cf2795ee7a87170c7aea05ae.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7d9e4a0ee1a3f5d5ff8159ea91a83310cf2795ee7a87170c7aea05ae.script (mintingInputs ctx) 1000)]
