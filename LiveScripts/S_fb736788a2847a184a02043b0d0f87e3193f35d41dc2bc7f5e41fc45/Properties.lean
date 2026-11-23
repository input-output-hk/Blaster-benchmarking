import CardanoLedgerApi.V3
import LiveScripts.S_fb736788a2847a184a02043b0d0f87e3193f35d41dc2bc7f5e41fc45.Script
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
      ¬ isSuccessful (cekExecuteProgram script_fb736788a2847a184a02043b0d0f87e3193f35d41dc2bc7f5e41fc45.script (mintingInputs ctx) 1000)]
