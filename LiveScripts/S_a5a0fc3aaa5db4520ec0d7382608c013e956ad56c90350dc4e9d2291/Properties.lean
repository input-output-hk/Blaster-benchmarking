import CardanoLedgerApi.V2
import LiveScripts.S_a5a0fc3aaa5db4520ec0d7382608c013e956ad56c90350dc4e9d2291.Script
import Blaster.Command.Syntax
import PlutusCore.UPLC.CekMachine
import PlutusCore.UPLC.Utils

open CardanoLedgerApi.V2
open PlutusCore.UPLC.CekMachine (cekExecuteProgram)
open PlutusCore.UPLC.Utils (isSuccessful)

-- A counterexample is a candidate until its concrete invocation is replayed.
-- Search purpose: mint; CEK fuel: 1000; SMT limit: 10 seconds.
#blaster (timeout: 10) (verbose: 1) (solve-result: 1)
  [∀ input : MintingInput,
    validMintingContext input →
      ¬ isSuccessful (cekExecuteProgram script_a5a0fc3aaa5db4520ec0d7382608c013e956ad56c90350dc4e9d2291.script (mintingInputs input) 1000)]
