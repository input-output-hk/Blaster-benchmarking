import CardanoLedgerApi.V3
import LiveScripts.S_54f9290a88a407b2a1b9ce2c9a96142d02a8d0b686a634346a00d1ef.Script
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
      ¬ isSuccessful (cekExecuteProgram script_54f9290a88a407b2a1b9ce2c9a96142d02a8d0b686a634346a00d1ef.script (mintingInputs ctx) 1000)]
