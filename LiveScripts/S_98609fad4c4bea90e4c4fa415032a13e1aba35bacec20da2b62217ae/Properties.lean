import CardanoLedgerApi.V3
import LiveScripts.S_98609fad4c4bea90e4c4fa415032a13e1aba35bacec20da2b62217ae.Script
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
      ¬ isSuccessful (cekExecuteProgram script_98609fad4c4bea90e4c4fa415032a13e1aba35bacec20da2b62217ae.script (mintingInputs ctx) 1000)]
