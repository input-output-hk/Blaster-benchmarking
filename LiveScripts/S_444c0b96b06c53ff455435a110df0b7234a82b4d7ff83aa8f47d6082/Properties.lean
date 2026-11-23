import CardanoLedgerApi.V3
import LiveScripts.S_444c0b96b06c53ff455435a110df0b7234a82b4d7ff83aa8f47d6082.Script
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
      ¬ isSuccessful (cekExecuteProgram script_444c0b96b06c53ff455435a110df0b7234a82b4d7ff83aa8f47d6082.script (mintingInputs ctx) 1000)]
