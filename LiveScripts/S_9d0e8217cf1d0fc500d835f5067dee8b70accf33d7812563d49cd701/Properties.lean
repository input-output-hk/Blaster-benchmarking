import CardanoLedgerApi.V2
import LiveScripts.S_9d0e8217cf1d0fc500d835f5067dee8b70accf33d7812563d49cd701.Script
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
      ¬ isSuccessful (cekExecuteProgram script_9d0e8217cf1d0fc500d835f5067dee8b70accf33d7812563d49cd701.script (mintingInputs input) 1000)]
