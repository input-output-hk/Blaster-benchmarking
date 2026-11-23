import CardanoLedgerApi.V3
import LiveScripts.S_5f953e8b28d8a037e661b138f5b5959d27d0e5291198f5efb1bf6507.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5f953e8b28d8a037e661b138f5b5959d27d0e5291198f5efb1bf6507.script (mintingInputs ctx) 1000)]
