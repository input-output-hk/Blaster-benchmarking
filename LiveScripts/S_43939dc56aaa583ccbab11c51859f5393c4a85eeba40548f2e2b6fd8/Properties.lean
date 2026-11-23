import CardanoLedgerApi.V3
import LiveScripts.S_43939dc56aaa583ccbab11c51859f5393c4a85eeba40548f2e2b6fd8.Script
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
      ¬ isSuccessful (cekExecuteProgram script_43939dc56aaa583ccbab11c51859f5393c4a85eeba40548f2e2b6fd8.script (mintingInputs ctx) 1000)]
