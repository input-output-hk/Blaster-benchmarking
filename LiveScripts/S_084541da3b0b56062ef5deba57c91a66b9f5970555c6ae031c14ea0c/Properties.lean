import LiveScripts.Shared
import LiveScripts.S_084541da3b0b56062ef5deba57c91a66b9f5970555c6ae031c14ea0c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_084541da3b0b56062ef5deba57c91a66b9f5970555c6ae031c14ea0c.script [ctx] 10000]
