import LiveScripts.Shared
import LiveScripts.S_7e8bdaf2b2b919a3a4b94002cafb50086c0c845fe535d07a77ab7f77.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7e8bdaf2b2b919a3a4b94002cafb50086c0c845fe535d07a77ab7f77.script [ctx] 10000]
