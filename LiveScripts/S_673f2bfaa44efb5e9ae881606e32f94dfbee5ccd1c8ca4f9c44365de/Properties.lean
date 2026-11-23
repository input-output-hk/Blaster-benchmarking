import CardanoLedgerApi.V3
import LiveScripts.S_673f2bfaa44efb5e9ae881606e32f94dfbee5ccd1c8ca4f9c44365de.Script
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
      ¬ isSuccessful (cekExecuteProgram script_673f2bfaa44efb5e9ae881606e32f94dfbee5ccd1c8ca4f9c44365de.script (mintingInputs ctx) 1000)]
