import LiveScripts.Shared
import LiveScripts.S_439e3795160cffc7174df0d8c0edf136ea4938673606c2ea12d799a6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_439e3795160cffc7174df0d8c0edf136ea4938673606c2ea12d799a6.script [ctx] 10000]
