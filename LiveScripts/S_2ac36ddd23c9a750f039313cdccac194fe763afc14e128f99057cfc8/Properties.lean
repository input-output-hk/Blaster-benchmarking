import CardanoLedgerApi.V3
import LiveScripts.S_2ac36ddd23c9a750f039313cdccac194fe763afc14e128f99057cfc8.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2ac36ddd23c9a750f039313cdccac194fe763afc14e128f99057cfc8.script (mintingInputs ctx) 1000)]
