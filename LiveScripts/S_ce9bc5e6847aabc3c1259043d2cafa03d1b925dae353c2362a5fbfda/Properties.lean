import CardanoLedgerApi.V3
import LiveScripts.S_ce9bc5e6847aabc3c1259043d2cafa03d1b925dae353c2362a5fbfda.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ce9bc5e6847aabc3c1259043d2cafa03d1b925dae353c2362a5fbfda.script (mintingInputs ctx) 1000)]
