import CardanoLedgerApi.V3
import LiveScripts.S_93e725af2737a05f29e9d4dfd329856d2a059f19a8ce6831d15409ec.Script
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
      ¬ isSuccessful (cekExecuteProgram script_93e725af2737a05f29e9d4dfd329856d2a059f19a8ce6831d15409ec.script (mintingInputs ctx) 1000)]
