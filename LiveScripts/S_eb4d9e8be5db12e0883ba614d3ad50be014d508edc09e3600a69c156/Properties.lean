import CardanoLedgerApi.V3
import LiveScripts.S_eb4d9e8be5db12e0883ba614d3ad50be014d508edc09e3600a69c156.Script
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
      ¬ isSuccessful (cekExecuteProgram script_eb4d9e8be5db12e0883ba614d3ad50be014d508edc09e3600a69c156.script (mintingInputs ctx) 1000)]
