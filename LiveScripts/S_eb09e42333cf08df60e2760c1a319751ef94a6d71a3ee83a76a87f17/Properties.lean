import CardanoLedgerApi.V3
import LiveScripts.S_eb09e42333cf08df60e2760c1a319751ef94a6d71a3ee83a76a87f17.Script
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
      ¬ isSuccessful (cekExecuteProgram script_eb09e42333cf08df60e2760c1a319751ef94a6d71a3ee83a76a87f17.script (spendingInputs ctx) 1000)]
