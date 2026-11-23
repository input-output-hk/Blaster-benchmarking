import CardanoLedgerApi.V3
import LiveScripts.S_7ab43502a69d4c2d6a622e01ab5364cd75add58398b161aefe96bcfd.Script
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
      ¬ isSuccessful (cekExecuteProgram script_7ab43502a69d4c2d6a622e01ab5364cd75add58398b161aefe96bcfd.script (mintingInputs ctx) 1000)]
