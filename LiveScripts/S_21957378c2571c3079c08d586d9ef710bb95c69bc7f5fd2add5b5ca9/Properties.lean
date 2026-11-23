import LiveScripts.Shared
import LiveScripts.S_21957378c2571c3079c08d586d9ef710bb95c69bc7f5fd2add5b5ca9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_21957378c2571c3079c08d586d9ef710bb95c69bc7f5fd2add5b5ca9.script [ctx] 10000]
