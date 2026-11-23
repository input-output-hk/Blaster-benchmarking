import LiveScripts.Shared
import LiveScripts.S_faf0f10d082403d39582b7fa25d76501dfc621ceb2a1eb795cf5970b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_faf0f10d082403d39582b7fa25d76501dfc621ceb2a1eb795cf5970b.script [ctx] 10000]
