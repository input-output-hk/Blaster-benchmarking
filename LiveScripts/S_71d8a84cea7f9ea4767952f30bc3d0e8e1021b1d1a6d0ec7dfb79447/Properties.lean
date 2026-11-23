import CardanoLedgerApi.V3
import LiveScripts.S_71d8a84cea7f9ea4767952f30bc3d0e8e1021b1d1a6d0ec7dfb79447.Script
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
      ¬ isSuccessful (cekExecuteProgram script_71d8a84cea7f9ea4767952f30bc3d0e8e1021b1d1a6d0ec7dfb79447.script (spendingInputs ctx) 1000)]
