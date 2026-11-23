import CardanoLedgerApi.V3
import LiveScripts.S_dcfd8426be7c6cb3c81aa8aa74f96e916240cd41bb538c7d2e69593c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_dcfd8426be7c6cb3c81aa8aa74f96e916240cd41bb538c7d2e69593c.script (mintingInputs ctx) 1000)]
