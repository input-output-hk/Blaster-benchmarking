import CardanoLedgerApi.V3
import LiveScripts.S_1ceaf5d8202b97ea49ffa38c844115c7ea77441fc71627778bd3b0bc.Script
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
      ¬ isSuccessful (cekExecuteProgram script_1ceaf5d8202b97ea49ffa38c844115c7ea77441fc71627778bd3b0bc.script (mintingInputs ctx) 1000)]
