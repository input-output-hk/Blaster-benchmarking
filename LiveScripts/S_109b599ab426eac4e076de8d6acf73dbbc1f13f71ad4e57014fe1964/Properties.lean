import CardanoLedgerApi.V3
import LiveScripts.S_109b599ab426eac4e076de8d6acf73dbbc1f13f71ad4e57014fe1964.Script
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
      ¬ isSuccessful (cekExecuteProgram script_109b599ab426eac4e076de8d6acf73dbbc1f13f71ad4e57014fe1964.script (mintingInputs ctx) 1000)]
