import CardanoLedgerApi.V3
import LiveScripts.S_6cdf22d07a805557eb66f35e6a863f9b2beb22093a8f2d5d578fff85.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6cdf22d07a805557eb66f35e6a863f9b2beb22093a8f2d5d578fff85.script (mintingInputs ctx) 1000)]
