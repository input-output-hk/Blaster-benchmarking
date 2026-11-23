import CardanoLedgerApi.V3
import LiveScripts.S_792b3f921d8a61b6fced92a0668ee9ac64be4b699ad4bbdd62916e77.Script
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
      ¬ isSuccessful (cekExecuteProgram script_792b3f921d8a61b6fced92a0668ee9ac64be4b699ad4bbdd62916e77.script (mintingInputs ctx) 1000)]
