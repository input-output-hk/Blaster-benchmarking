import CardanoLedgerApi.V3
import LiveScripts.S_c26ec2a22a13f5912ab2c81f07102f62cea76a759dd4f19d9d0b1f02.Script
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
      ¬ isSuccessful (cekExecuteProgram script_c26ec2a22a13f5912ab2c81f07102f62cea76a759dd4f19d9d0b1f02.script (spendingInputs ctx) 1000)]
