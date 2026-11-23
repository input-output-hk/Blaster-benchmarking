import CardanoLedgerApi.V3
import LiveScripts.S_de633cfa0a7ebc0aa72fdcec1663ea941b65e2e8bd7e5276f57d8876.Script
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
      ¬ isSuccessful (cekExecuteProgram script_de633cfa0a7ebc0aa72fdcec1663ea941b65e2e8bd7e5276f57d8876.script (spendingInputs ctx) 1000)]
