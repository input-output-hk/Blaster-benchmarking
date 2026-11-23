import CardanoLedgerApi.V3
import LiveScripts.S_4730b708f37d24c025f52a66701a622d56d5d1da28ae8c777c3e1ec2.Script
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
      ¬ isSuccessful (cekExecuteProgram script_4730b708f37d24c025f52a66701a622d56d5d1da28ae8c777c3e1ec2.script (spendingInputs ctx) 1000)]
