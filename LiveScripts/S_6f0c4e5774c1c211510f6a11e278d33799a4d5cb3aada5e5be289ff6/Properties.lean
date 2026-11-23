import CardanoLedgerApi.V3
import LiveScripts.S_6f0c4e5774c1c211510f6a11e278d33799a4d5cb3aada5e5be289ff6.Script
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
      ¬ isSuccessful (cekExecuteProgram script_6f0c4e5774c1c211510f6a11e278d33799a4d5cb3aada5e5be289ff6.script (mintingInputs ctx) 1000)]
