import CardanoLedgerApi.V3
import LiveScripts.S_f1edf8ccfa0a215698475190f97dfb4a65c68a5bf166fa81db4d4aa6.Script
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
      ¬ isSuccessful (cekExecuteProgram script_f1edf8ccfa0a215698475190f97dfb4a65c68a5bf166fa81db4d4aa6.script (mintingInputs ctx) 1000)]
