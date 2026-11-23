import CardanoLedgerApi.V3
import LiveScripts.S_263d5615bf97333cc5b794d0361c303247d2580cc50e5c0c3fe1760a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_263d5615bf97333cc5b794d0361c303247d2580cc50e5c0c3fe1760a.script (mintingInputs ctx) 1000)]
