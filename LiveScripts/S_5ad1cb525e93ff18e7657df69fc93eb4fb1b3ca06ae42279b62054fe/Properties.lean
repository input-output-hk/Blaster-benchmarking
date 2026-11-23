import CardanoLedgerApi.V3
import LiveScripts.S_5ad1cb525e93ff18e7657df69fc93eb4fb1b3ca06ae42279b62054fe.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5ad1cb525e93ff18e7657df69fc93eb4fb1b3ca06ae42279b62054fe.script (mintingInputs ctx) 1000)]
