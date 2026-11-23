import CardanoLedgerApi.V3
import LiveScripts.S_077d1dc97ff465aa817f859b722b342355c98603b6d2cb51be2e5c9a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_077d1dc97ff465aa817f859b722b342355c98603b6d2cb51be2e5c9a.script (mintingInputs ctx) 1000)]
