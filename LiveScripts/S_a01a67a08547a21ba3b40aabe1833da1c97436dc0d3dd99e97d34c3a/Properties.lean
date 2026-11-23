import CardanoLedgerApi.V3
import LiveScripts.S_a01a67a08547a21ba3b40aabe1833da1c97436dc0d3dd99e97d34c3a.Script
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
      ¬ isSuccessful (cekExecuteProgram script_a01a67a08547a21ba3b40aabe1833da1c97436dc0d3dd99e97d34c3a.script (mintingInputs ctx) 1000)]
