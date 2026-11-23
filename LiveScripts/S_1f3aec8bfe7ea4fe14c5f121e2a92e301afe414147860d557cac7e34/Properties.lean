import CardanoLedgerApi.V3
import LiveScripts.S_1f3aec8bfe7ea4fe14c5f121e2a92e301afe414147860d557cac7e34.Script
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
      ¬ isSuccessful (cekExecuteProgram script_1f3aec8bfe7ea4fe14c5f121e2a92e301afe414147860d557cac7e34.script (mintingInputs ctx) 1000)]
