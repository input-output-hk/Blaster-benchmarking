import CardanoLedgerApi.V3
import LiveScripts.S_26227a36b8e3f3866be3cb5b90d4b2effa053f6e6a0958cc3654718b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_26227a36b8e3f3866be3cb5b90d4b2effa053f6e6a0958cc3654718b.script (mintingInputs ctx) 1000)]
