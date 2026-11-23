import CardanoLedgerApi.V3
import LiveScripts.S_bcd713bb7858d4b08738bed90ee7068d8f9b38d02e0cae0b45ac7a9b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_bcd713bb7858d4b08738bed90ee7068d8f9b38d02e0cae0b45ac7a9b.script (mintingInputs ctx) 1000)]
