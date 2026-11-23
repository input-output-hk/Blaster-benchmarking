import CardanoLedgerApi.V3
import LiveScripts.S_499d79b75ec2acf7e7ab36e0e15f04b44b83c3bff091083e4d0b4979.Script
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
      ¬ isSuccessful (cekExecuteProgram script_499d79b75ec2acf7e7ab36e0e15f04b44b83c3bff091083e4d0b4979.script (mintingInputs ctx) 1000)]
