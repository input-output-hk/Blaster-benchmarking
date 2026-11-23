import CardanoLedgerApi.V3
import LiveScripts.S_61f052212c52b614f3c1c6233416c3b1ee41f536608fddea7eb9eb7d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_61f052212c52b614f3c1c6233416c3b1ee41f536608fddea7eb9eb7d.script (mintingInputs ctx) 1000)]
