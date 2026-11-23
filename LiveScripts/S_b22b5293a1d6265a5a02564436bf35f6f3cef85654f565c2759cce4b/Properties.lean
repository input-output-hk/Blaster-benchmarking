import LiveScripts.Shared
import LiveScripts.S_b22b5293a1d6265a5a02564436bf35f6f3cef85654f565c2759cce4b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b22b5293a1d6265a5a02564436bf35f6f3cef85654f565c2759cce4b.script [ctx] 10000]
