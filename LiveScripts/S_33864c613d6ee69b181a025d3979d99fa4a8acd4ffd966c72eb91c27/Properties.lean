import CardanoLedgerApi.V3
import LiveScripts.S_33864c613d6ee69b181a025d3979d99fa4a8acd4ffd966c72eb91c27.Script
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
      ¬ isSuccessful (cekExecuteProgram script_33864c613d6ee69b181a025d3979d99fa4a8acd4ffd966c72eb91c27.script (mintingInputs ctx) 1000)]
