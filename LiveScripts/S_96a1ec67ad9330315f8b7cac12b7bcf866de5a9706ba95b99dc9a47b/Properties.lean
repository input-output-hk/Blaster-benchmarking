import CardanoLedgerApi.V3
import LiveScripts.S_96a1ec67ad9330315f8b7cac12b7bcf866de5a9706ba95b99dc9a47b.Script
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
      ¬ isSuccessful (cekExecuteProgram script_96a1ec67ad9330315f8b7cac12b7bcf866de5a9706ba95b99dc9a47b.script (spendingInputs ctx) 1000)]
