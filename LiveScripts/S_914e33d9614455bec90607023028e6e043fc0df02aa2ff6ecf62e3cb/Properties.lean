import LiveScripts.Shared
import LiveScripts.S_914e33d9614455bec90607023028e6e043fc0df02aa2ff6ecf62e3cb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_914e33d9614455bec90607023028e6e043fc0df02aa2ff6ecf62e3cb.script [ctx] 10000]
