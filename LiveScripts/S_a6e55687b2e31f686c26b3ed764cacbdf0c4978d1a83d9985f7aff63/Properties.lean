import LiveScripts.Shared
import LiveScripts.S_a6e55687b2e31f686c26b3ed764cacbdf0c4978d1a83d9985f7aff63.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a6e55687b2e31f686c26b3ed764cacbdf0c4978d1a83d9985f7aff63.script [ctx] 10000]
