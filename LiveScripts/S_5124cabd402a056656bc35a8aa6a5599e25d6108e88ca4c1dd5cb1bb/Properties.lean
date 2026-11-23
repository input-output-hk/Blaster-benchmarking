import CardanoLedgerApi.V3
import LiveScripts.S_5124cabd402a056656bc35a8aa6a5599e25d6108e88ca4c1dd5cb1bb.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5124cabd402a056656bc35a8aa6a5599e25d6108e88ca4c1dd5cb1bb.script (mintingInputs ctx) 1000)]
