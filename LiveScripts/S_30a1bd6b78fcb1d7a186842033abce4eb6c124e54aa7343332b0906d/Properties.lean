import LiveScripts.Shared
import LiveScripts.S_30a1bd6b78fcb1d7a186842033abce4eb6c124e54aa7343332b0906d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_30a1bd6b78fcb1d7a186842033abce4eb6c124e54aa7343332b0906d.script [ctx] 10000]
