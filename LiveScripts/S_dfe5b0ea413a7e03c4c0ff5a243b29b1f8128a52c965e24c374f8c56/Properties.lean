import CardanoLedgerApi.V3
import LiveScripts.S_dfe5b0ea413a7e03c4c0ff5a243b29b1f8128a52c965e24c374f8c56.Script
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
      ¬ isSuccessful (cekExecuteProgram script_dfe5b0ea413a7e03c4c0ff5a243b29b1f8128a52c965e24c374f8c56.script (mintingInputs ctx) 1000)]
