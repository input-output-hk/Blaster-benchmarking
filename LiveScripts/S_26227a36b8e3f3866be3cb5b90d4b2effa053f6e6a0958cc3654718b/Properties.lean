import LiveScripts.Shared
import LiveScripts.S_26227a36b8e3f3866be3cb5b90d4b2effa053f6e6a0958cc3654718b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_26227a36b8e3f3866be3cb5b90d4b2effa053f6e6a0958cc3654718b.script [ctx] 10000]
