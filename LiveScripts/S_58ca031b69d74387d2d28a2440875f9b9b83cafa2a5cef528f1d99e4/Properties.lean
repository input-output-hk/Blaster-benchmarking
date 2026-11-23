import LiveScripts.Shared
import LiveScripts.S_58ca031b69d74387d2d28a2440875f9b9b83cafa2a5cef528f1d99e4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_58ca031b69d74387d2d28a2440875f9b9b83cafa2a5cef528f1d99e4.script [ctx] 10000]
