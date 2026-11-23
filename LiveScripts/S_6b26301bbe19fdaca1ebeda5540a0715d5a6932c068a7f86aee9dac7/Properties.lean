import CardanoLedgerApi.V3
import LiveScripts.S_6b26301bbe19fdaca1ebeda5540a0715d5a6932c068a7f86aee9dac7.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6b26301bbe19fdaca1ebeda5540a0715d5a6932c068a7f86aee9dac7.script (mintingInputs ctx) 1000)]
