import CardanoLedgerApi.V3
import LiveScripts.S_2c04d6355b305d3e6d14b2658d4ff459be2b2f57e6149e9dbc3b9bf1.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2c04d6355b305d3e6d14b2658d4ff459be2b2f57e6149e9dbc3b9bf1.script (mintingInputs ctx) 1000)]
