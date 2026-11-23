import CardanoLedgerApi.V3
import LiveScripts.S_68a98674968b50678c94eb70cf2a10e6b6eaaf2776ca62821c65109b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_68a98674968b50678c94eb70cf2a10e6b6eaaf2776ca62821c65109b.script (mintingInputs ctx) 1000)]
