import CardanoLedgerApi.V3
import LiveScripts.S_d4e933f6aa5dbd283a0a5f4c51fbb571183b883c35f0173745f5b692.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d4e933f6aa5dbd283a0a5f4c51fbb571183b883c35f0173745f5b692.script (mintingInputs ctx) 1000)]
