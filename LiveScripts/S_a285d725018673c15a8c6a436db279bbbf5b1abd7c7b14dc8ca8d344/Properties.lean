import CardanoLedgerApi.V3
import LiveScripts.S_a285d725018673c15a8c6a436db279bbbf5b1abd7c7b14dc8ca8d344.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a285d725018673c15a8c6a436db279bbbf5b1abd7c7b14dc8ca8d344.script (mintingInputs ctx) 1000)]
