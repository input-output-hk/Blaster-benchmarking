import LiveScripts.Shared
import LiveScripts.S_de8d3cb923a28afedbe79b02f25b0bafa039c9b2a444e9f45d8a9bac.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_de8d3cb923a28afedbe79b02f25b0bafa039c9b2a444e9f45d8a9bac.script [ctx] 10000]
