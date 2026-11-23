import LiveScripts.Shared
import LiveScripts.S_a2da449e1a6a3ede8a824823a625a8f70fb248c8b0283b13858986bd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a2da449e1a6a3ede8a824823a625a8f70fb248c8b0283b13858986bd.script [ctx] 10000]
