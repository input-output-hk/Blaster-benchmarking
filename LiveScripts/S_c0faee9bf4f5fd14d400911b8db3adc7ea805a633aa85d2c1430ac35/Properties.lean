import CardanoLedgerApi.V3
import LiveScripts.S_c0faee9bf4f5fd14d400911b8db3adc7ea805a633aa85d2c1430ac35.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c0faee9bf4f5fd14d400911b8db3adc7ea805a633aa85d2c1430ac35.script (mintingInputs ctx) 1000)]
