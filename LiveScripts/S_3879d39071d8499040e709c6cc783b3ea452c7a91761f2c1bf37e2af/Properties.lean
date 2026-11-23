import CardanoLedgerApi.V3
import LiveScripts.S_3879d39071d8499040e709c6cc783b3ea452c7a91761f2c1bf37e2af.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: spend; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validSpendingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_3879d39071d8499040e709c6cc783b3ea452c7a91761f2c1bf37e2af.script (spendingInputs ctx) 1000)]
