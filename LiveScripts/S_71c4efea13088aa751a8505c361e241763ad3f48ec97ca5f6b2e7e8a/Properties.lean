import LiveScripts.Shared
import LiveScripts.S_71c4efea13088aa751a8505c361e241763ad3f48ec97ca5f6b2e7e8a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_71c4efea13088aa751a8505c361e241763ad3f48ec97ca5f6b2e7e8a.script [datum, redeemer, ctx] 10000]
