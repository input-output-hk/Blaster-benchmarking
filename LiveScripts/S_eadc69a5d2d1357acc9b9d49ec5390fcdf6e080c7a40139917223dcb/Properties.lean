import CardanoLedgerApi.V3
import LiveScripts.S_eadc69a5d2d1357acc9b9d49ec5390fcdf6e080c7a40139917223dcb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_eadc69a5d2d1357acc9b9d49ec5390fcdf6e080c7a40139917223dcb.script (mintingInputs ctx) 1000)]
