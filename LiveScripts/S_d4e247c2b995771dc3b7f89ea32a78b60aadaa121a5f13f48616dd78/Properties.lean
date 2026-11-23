import CardanoLedgerApi.V3
import LiveScripts.S_d4e247c2b995771dc3b7f89ea32a78b60aadaa121a5f13f48616dd78.Script
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
      ¬ isSuccessful (cekExecuteProgram script_d4e247c2b995771dc3b7f89ea32a78b60aadaa121a5f13f48616dd78.script (mintingInputs ctx) 1000)]
