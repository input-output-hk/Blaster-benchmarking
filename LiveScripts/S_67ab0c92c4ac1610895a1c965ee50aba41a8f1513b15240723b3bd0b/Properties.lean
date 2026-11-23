import CardanoLedgerApi.V3
import LiveScripts.S_67ab0c92c4ac1610895a1c965ee50aba41a8f1513b15240723b3bd0b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_67ab0c92c4ac1610895a1c965ee50aba41a8f1513b15240723b3bd0b.script (mintingInputs ctx) 1000)]
