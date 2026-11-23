import CardanoLedgerApi.V3
import LiveScripts.S_5b2a641a9ea8d870c9f16f35eccc82f3aa348cea7359d8b61c2daa18.Script
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
      ¬ isSuccessful (cekExecuteProgram script_5b2a641a9ea8d870c9f16f35eccc82f3aa348cea7359d8b61c2daa18.script (spendingInputs ctx) 1000)]
