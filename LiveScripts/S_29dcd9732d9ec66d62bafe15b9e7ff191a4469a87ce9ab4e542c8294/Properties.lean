import CardanoLedgerApi.V3
import LiveScripts.S_29dcd9732d9ec66d62bafe15b9e7ff191a4469a87ce9ab4e542c8294.Script
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
      ¬ isSuccessful (cekExecuteProgram script_29dcd9732d9ec66d62bafe15b9e7ff191a4469a87ce9ab4e542c8294.script (mintingInputs ctx) 1000)]
