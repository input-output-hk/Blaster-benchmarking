import CardanoLedgerApi.V3
import LiveScripts.S_48647c3e26b7444bc609e233e8b1f0867925aaa854d5d1688f2becb9.Script
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
      ¬ isSuccessful (cekExecuteProgram script_48647c3e26b7444bc609e233e8b1f0867925aaa854d5d1688f2becb9.script (mintingInputs ctx) 1000)]
