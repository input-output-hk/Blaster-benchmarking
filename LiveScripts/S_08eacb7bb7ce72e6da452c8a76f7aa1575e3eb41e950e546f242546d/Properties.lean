import CardanoLedgerApi.V3
import LiveScripts.S_08eacb7bb7ce72e6da452c8a76f7aa1575e3eb41e950e546f242546d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_08eacb7bb7ce72e6da452c8a76f7aa1575e3eb41e950e546f242546d.script (mintingInputs ctx) 1000)]
