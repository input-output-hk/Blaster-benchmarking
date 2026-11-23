import CardanoLedgerApi.V3
import LiveScripts.S_ac1d27971c868a42249d2ede2b183e3ea37b40db94eacee6f978ccf7.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ac1d27971c868a42249d2ede2b183e3ea37b40db94eacee6f978ccf7.script (mintingInputs ctx) 1000)]
