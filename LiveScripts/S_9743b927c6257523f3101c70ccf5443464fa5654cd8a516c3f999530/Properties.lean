import LiveScripts.Shared
import LiveScripts.S_9743b927c6257523f3101c70ccf5443464fa5654cd8a516c3f999530.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9743b927c6257523f3101c70ccf5443464fa5654cd8a516c3f999530.script [ctx] 10000]
