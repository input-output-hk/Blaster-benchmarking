import CardanoLedgerApi.V3
import LiveScripts.S_0b5e2f54fb59f28d70cf7486e77e64782e0b357bbce40ec50e9a0f05.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: mint; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validMintingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_0b5e2f54fb59f28d70cf7486e77e64782e0b357bbce40ec50e9a0f05.script (mintingInputs ctx) 1000)]
