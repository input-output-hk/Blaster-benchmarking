import LiveScripts.Shared
import LiveScripts.S_8d1eebfb7948248299d0cee23b85c18ee42c5fa64198e9aef5d5dd7e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8d1eebfb7948248299d0cee23b85c18ee42c5fa64198e9aef5d5dd7e.script [redeemer, ctx] 10000]
