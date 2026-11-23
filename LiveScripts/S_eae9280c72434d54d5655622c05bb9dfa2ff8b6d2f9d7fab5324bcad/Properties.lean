import CardanoLedgerApi.V3
import LiveScripts.S_eae9280c72434d54d5655622c05bb9dfa2ff8b6d2f9d7fab5324bcad.Script
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
      ¬ isSuccessful (cekExecuteProgram script_eae9280c72434d54d5655622c05bb9dfa2ff8b6d2f9d7fab5324bcad.script (mintingInputs ctx) 1000)]
