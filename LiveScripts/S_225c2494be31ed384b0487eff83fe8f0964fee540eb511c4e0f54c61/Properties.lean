import CardanoLedgerApi.V3
import LiveScripts.S_225c2494be31ed384b0487eff83fe8f0964fee540eb511c4e0f54c61.Script
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
      ¬ isSuccessful (cekExecuteProgram script_225c2494be31ed384b0487eff83fe8f0964fee540eb511c4e0f54c61.script (mintingInputs ctx) 1000)]
