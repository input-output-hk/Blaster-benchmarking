import LiveScripts.Shared
import LiveScripts.S_2f8e022ce90123b7dcea5b6908128505b443c833ea07aa8640cfa09e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2f8e022ce90123b7dcea5b6908128505b443c833ea07aa8640cfa09e.script [ctx] 10000]
