import LiveScripts.Shared
import LiveScripts.S_2bf1d406b733988e82bc6bb0dc47917cbd3fbde15d58189bfd24d2aa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2bf1d406b733988e82bc6bb0dc47917cbd3fbde15d58189bfd24d2aa.script [ctx] 10000]
