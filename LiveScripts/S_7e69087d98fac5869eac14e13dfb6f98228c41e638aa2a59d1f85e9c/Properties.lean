import LiveScripts.Shared
import LiveScripts.S_7e69087d98fac5869eac14e13dfb6f98228c41e638aa2a59d1f85e9c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7e69087d98fac5869eac14e13dfb6f98228c41e638aa2a59d1f85e9c.script [ctx] 10000]
