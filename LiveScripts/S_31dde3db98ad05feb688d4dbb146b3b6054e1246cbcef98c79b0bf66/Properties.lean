import LiveScripts.Shared
import LiveScripts.S_31dde3db98ad05feb688d4dbb146b3b6054e1246cbcef98c79b0bf66.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_31dde3db98ad05feb688d4dbb146b3b6054e1246cbcef98c79b0bf66.script [ctx] 10000]
