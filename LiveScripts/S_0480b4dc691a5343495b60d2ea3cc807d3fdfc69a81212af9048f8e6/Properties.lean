import LiveScripts.Shared
import LiveScripts.S_0480b4dc691a5343495b60d2ea3cc807d3fdfc69a81212af9048f8e6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0480b4dc691a5343495b60d2ea3cc807d3fdfc69a81212af9048f8e6.script [ctx] 10000]
