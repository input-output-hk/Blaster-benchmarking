import CardanoLedgerApi.V3
import LiveScripts.S_db7d6ccf4df88c935a552d6956272c999e8344fe2bc0e69a7a688a8f.Script
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
      ¬ isSuccessful (cekExecuteProgram script_db7d6ccf4df88c935a552d6956272c999e8344fe2bc0e69a7a688a8f.script (mintingInputs ctx) 1000)]
