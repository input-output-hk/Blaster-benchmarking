import CardanoLedgerApi.V3
import LiveScripts.S_74e141df5e7c8a84f8e462b0da7df4323f0e997a1db7c78d46fea3e5.Script
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
      ¬ isSuccessful (cekExecuteProgram script_74e141df5e7c8a84f8e462b0da7df4323f0e997a1db7c78d46fea3e5.script (spendingInputs ctx) 1000)]
