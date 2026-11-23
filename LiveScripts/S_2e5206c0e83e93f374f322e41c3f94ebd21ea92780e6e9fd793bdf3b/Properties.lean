import CardanoLedgerApi.V3
import LiveScripts.S_2e5206c0e83e93f374f322e41c3f94ebd21ea92780e6e9fd793bdf3b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_2e5206c0e83e93f374f322e41c3f94ebd21ea92780e6e9fd793bdf3b.script (spendingInputs ctx) 1000)]
