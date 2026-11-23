import CardanoLedgerApi.V3
import LiveScripts.S_c99ed7e1d371ca7658ef70391785a7d173bde7dfc9137a7709c31de9.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c99ed7e1d371ca7658ef70391785a7d173bde7dfc9137a7709c31de9.script (spendingInputs ctx) 1000)]
