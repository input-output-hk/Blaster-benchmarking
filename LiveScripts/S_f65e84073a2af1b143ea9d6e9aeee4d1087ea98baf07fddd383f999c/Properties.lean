import LiveScripts.Shared
import LiveScripts.S_f65e84073a2af1b143ea9d6e9aeee4d1087ea98baf07fddd383f999c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f65e84073a2af1b143ea9d6e9aeee4d1087ea98baf07fddd383f999c.script [ctx] 10000]
