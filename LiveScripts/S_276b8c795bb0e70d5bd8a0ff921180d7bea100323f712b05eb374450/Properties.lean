import CardanoLedgerApi.V3
import LiveScripts.S_276b8c795bb0e70d5bd8a0ff921180d7bea100323f712b05eb374450.Script
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
      ¬ isSuccessful (cekExecuteProgram script_276b8c795bb0e70d5bd8a0ff921180d7bea100323f712b05eb374450.script (mintingInputs ctx) 1000)]
