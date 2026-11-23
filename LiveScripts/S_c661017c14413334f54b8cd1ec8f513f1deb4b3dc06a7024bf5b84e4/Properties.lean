import CardanoLedgerApi.V3
import LiveScripts.S_c661017c14413334f54b8cd1ec8f513f1deb4b3dc06a7024bf5b84e4.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V3
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: cert; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ ctx : ScriptContext,
    validCertifyingContext ctx →
      ¬ isSuccessful (cekExecuteProgram script_c661017c14413334f54b8cd1ec8f513f1deb4b3dc06a7024bf5b84e4.script (certifyingInputs ctx) 1000)]
