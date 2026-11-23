import LiveScripts.Shared
import LiveScripts.S_f3703ca77946c46b56e55b3e4b8a227938b0ab4eb6ce02b8794e1802.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f3703ca77946c46b56e55b3e4b8a227938b0ab4eb6ce02b8794e1802.script [ctx] 10000]
