import LiveScripts.Shared
import LiveScripts.S_f5af55206bad884e4c54a8c0f9b6ca9beba1f626398ac4974f8b80b5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f5af55206bad884e4c54a8c0f9b6ca9beba1f626398ac4974f8b80b5.script [ctx] 10000]
