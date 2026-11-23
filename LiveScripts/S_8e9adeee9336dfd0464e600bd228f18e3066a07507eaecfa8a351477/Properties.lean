import LiveScripts.Shared
import LiveScripts.S_8e9adeee9336dfd0464e600bd228f18e3066a07507eaecfa8a351477.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8e9adeee9336dfd0464e600bd228f18e3066a07507eaecfa8a351477.script [redeemer, ctx] 10000]
