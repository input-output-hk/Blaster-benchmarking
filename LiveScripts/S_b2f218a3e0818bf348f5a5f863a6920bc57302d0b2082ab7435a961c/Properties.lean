import CardanoLedgerApi.V3
import LiveScripts.S_b2f218a3e0818bf348f5a5f863a6920bc57302d0b2082ab7435a961c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_b2f218a3e0818bf348f5a5f863a6920bc57302d0b2082ab7435a961c.script (mintingInputs ctx) 1000)]
