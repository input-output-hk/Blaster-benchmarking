import CardanoLedgerApi.V2
import LiveScripts.S_ca7ec808bbeedd6035d1367534b9676e1e8a1be3969b960e4a57b99c.Script
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
      ¬ isSuccessful (cekExecuteProgram script_ca7ec808bbeedd6035d1367534b9676e1e8a1be3969b960e4a57b99c.script (mintingInputs input) 1000)]
