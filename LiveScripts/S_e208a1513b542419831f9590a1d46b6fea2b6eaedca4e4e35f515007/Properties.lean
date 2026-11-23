import CardanoLedgerApi.V3
import LiveScripts.S_e208a1513b542419831f9590a1d46b6fea2b6eaedca4e4e35f515007.Script
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
      ¬ isSuccessful (cekExecuteProgram script_e208a1513b542419831f9590a1d46b6fea2b6eaedca4e4e35f515007.script (mintingInputs ctx) 1000)]
