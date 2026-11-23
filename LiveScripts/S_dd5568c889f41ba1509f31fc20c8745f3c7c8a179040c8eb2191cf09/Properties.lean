import CardanoLedgerApi.V3
import LiveScripts.S_dd5568c889f41ba1509f31fc20c8745f3c7c8a179040c8eb2191cf09.Script
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
      ¬ isSuccessful (cekExecuteProgram script_dd5568c889f41ba1509f31fc20c8745f3c7c8a179040c8eb2191cf09.script (mintingInputs ctx) 1000)]
