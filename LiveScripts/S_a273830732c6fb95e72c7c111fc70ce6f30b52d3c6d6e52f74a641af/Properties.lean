import CardanoLedgerApi.V3
import LiveScripts.S_a273830732c6fb95e72c7c111fc70ce6f30b52d3c6d6e52f74a641af.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a273830732c6fb95e72c7c111fc70ce6f30b52d3c6d6e52f74a641af.script (mintingInputs ctx) 1000)]
