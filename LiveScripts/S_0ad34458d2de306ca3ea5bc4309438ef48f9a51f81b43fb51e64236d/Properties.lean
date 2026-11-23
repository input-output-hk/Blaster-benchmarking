import CardanoLedgerApi.V3
import LiveScripts.S_0ad34458d2de306ca3ea5bc4309438ef48f9a51f81b43fb51e64236d.Script
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
      ¬ isSuccessful (cekExecuteProgram script_0ad34458d2de306ca3ea5bc4309438ef48f9a51f81b43fb51e64236d.script (spendingInputs ctx) 1000)]
