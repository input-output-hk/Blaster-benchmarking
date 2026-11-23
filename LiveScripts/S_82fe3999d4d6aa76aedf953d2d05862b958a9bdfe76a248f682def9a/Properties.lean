import CardanoLedgerApi.V3
import LiveScripts.S_82fe3999d4d6aa76aedf953d2d05862b958a9bdfe76a248f682def9a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_82fe3999d4d6aa76aedf953d2d05862b958a9bdfe76a248f682def9a.script (spendingInputs ctx) 1000)]
