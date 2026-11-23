import LiveScripts.Shared
import LiveScripts.S_a717047256f09387f63d025d8e6bb86fd92ada0db989a1a2ff3975d0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a717047256f09387f63d025d8e6bb86fd92ada0db989a1a2ff3975d0.script [ctx] 10000]
