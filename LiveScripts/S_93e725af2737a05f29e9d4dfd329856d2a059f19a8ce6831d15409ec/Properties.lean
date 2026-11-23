import LiveScripts.Shared
import LiveScripts.S_93e725af2737a05f29e9d4dfd329856d2a059f19a8ce6831d15409ec.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_93e725af2737a05f29e9d4dfd329856d2a059f19a8ce6831d15409ec.script [ctx] 10000]
