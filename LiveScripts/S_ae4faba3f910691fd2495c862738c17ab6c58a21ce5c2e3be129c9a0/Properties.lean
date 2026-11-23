import LiveScripts.Shared
import LiveScripts.S_ae4faba3f910691fd2495c862738c17ab6c58a21ce5c2e3be129c9a0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ae4faba3f910691fd2495c862738c17ab6c58a21ce5c2e3be129c9a0.script [ctx] 10000]
